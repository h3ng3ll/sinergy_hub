# Location & Distance — Backend Contract

This document is the contract between the Flutter client and the backend
(Cloud Functions) for user location: country and city on the profile,
GPS coordinates, distance between members, and the "within X km" candidate
search.

**Core principle: exact coordinates are write-only and server-private.**

- The client **sends** coordinates to the backend through one callable and
  can **never read them back**, neither its own nor anyone else's.
- The backend decides **where and how** coordinates are stored (collection,
  geohash, precision, retention). This contract fixes only the guarantees in
  §2.
- The backend only ever returns **distances**, never coordinates or anything
  a coordinate can be derived from.

Country and city are **public profile text**. They live in `users/{uid}` and
are shown on cards.

Related: `docs/liked_you_backend_contract.md` (the Liked-you feed also
carries city, country and distance, see its §5).

## 1. Public profile field — `users/{uid}.location`

Written by the client as part of the normal profile save (the same full-document
write as the rest of the profile). This is the only location data in
`users/{uid}`.

```json
"location": {
  "country": "Ukraine",
  "city": "Kyiv",
  "countryCode": "UA",
  "countryKey": "ukraine",
  "cityKey": "kyiv",
  "hasCoordinates": true
}
```

| Field | Type | Meaning |
|---|---|---|
| `country` | `string \| null` | Display text. It is filled by reverse geocoding or typed by the user, and stays editable. |
| `city` | `string \| null` | Display text, same as `country`. |
| `countryCode` | `string \| null` | ISO 3166-1 alpha-2 code. Present only when the place came from reverse geocoding. |
| `countryKey` | `string \| null` | `country.trim().toLowerCase()`, or `null` when empty. It is used for the **City** filter mode (§5). |
| `cityKey` | `string \| null` | `city.trim().toLowerCase()`, or `null` when empty. |
| `hasCoordinates` | `bool` | **A UI hint only.** It means the backend holds coordinates for this user. It is set by the backend (§2). The client copies the existing value on save and uses it only to enable or disable the Distance filter. **The backend must never trust it**: every distance or radius function checks its own coordinate store. |

`location` may be missing entirely, for a user who never set it. Then the
cards show no location line.

**Never write latitude, longitude, geohash or any coordinate-derived value
into `users/{uid}`.** The `users` collection is readable by other signed-in
clients, which query it directly for the swipe deck.

## 2. Callable `updateUserCoordinates`

The client sends it right after a profile save, **only** when the user tapped
"Use my location" during that edit session. It is sent from both Edit Profile
and onboarding.

### Request (exactly what the client sends)

```json
{
  "latitude": 50.4501,
  "longitude": 30.5234,
  "accuracyMeters": 14.2,
  "capturedAt": "2026-09-27T14:03:12Z",
  "country": "Ukraine",
  "countryCode": "UA",
  "city": "Kyiv"
}
```

| Field | Type | Meaning |
|---|---|---|
| `latitude` | `double` | WGS-84, `-90..90`. Required. |
| `longitude` | `double` | WGS-84, `-180..180`. Required. |
| `accuracyMeters` | `double \| null` | The device's reported horizontal accuracy. |
| `capturedAt` | `ISO-8601 UTC string` | When the position was taken on the device. |
| `country`, `countryCode`, `city` | `string \| null` | The reverse-geocoded place, before any user edits. **Informational only.** The public `users/{uid}.location` text is whatever the user saved (§1). |

### Response

```json
{ "hasCoordinates": true }
```

### Required behaviour

- Auth is required. The uid is taken from `request.auth` only, never from the
  payload.
- Validate the ranges and reject `NaN`, `(0, 0)` and a `capturedAt` more than
  24 h in the future, with `invalid-argument`.
- Store the coordinates wherever and however the backend chooses, **subject
  to these guarantees**:
  1. No client can read them, directly (security rules deny it) or through
     any function.
  2. No function response, error message or log line contains them.
  3. Only the latest position per user is kept. Each call replaces the
     previous one.
- Set `users/{uid}.location.hasCoordinates = true` (a merge write that doesn't
  touch the other fields).
- Rate limit: suggested ≤ 10 calls per hour per user → `resource-exhausted`.

### Client handling

A failure here is **non-fatal**. The profile is already saved, and the user
sees "Location could not be synced". There is no retry loop; the next
"Use my location" plus Save retries it.

## 3. Callable `getCandidateDistances`

The client calls this for each page of Home swipe-deck candidates when the
deck is **not** in Distance mode, to show "~12 km" on cards.

### Request

```json
{ "uids": ["uA", "uB", "uC"] }
```

- At most **20** uids per call; the client chunks larger pages. More than 20
  → `invalid-argument`.

### Response

```json
{ "distances": { "uA": 3.4, "uB": null, "uC": 127.0 } }
```

| Rule | |
|---|---|
| Unit | Kilometres, great-circle (haversine), **rounded to 0.1 km**. |
| `null` | The candidate has no stored coordinates, **or** the caller has none. |
| Missing key | The same as `null`. The client tolerates it. |
| Unknown / deleted / blocked uid | `null`. It never errors and never reveals whether the uid exists. |

### Anti-triangulation

The distance is exact enough to display but must not let a caller locate
anyone by moving and re-querying:

- Round to 0.1 km (above). Distances **below 1 km are returned as `0.5`**,
  which the client shows as "< 1 km".
- Rate limit: suggested ≤ 120 calls per hour per caller → `resource-exhausted`.
- Distances are computed only from **stored** positions, which the caller can
  change at most 10 times per hour (§2).

### Client handling

Any error is **non-fatal**: the cards show no distance. The deck itself is
unaffected.

## 4. Callable `searchNearbyCandidates`

This powers the Home filter's **Distance** mode ("within X km"). A radius search
needs coordinates, so it can only run on the server; the client cannot query
`users` by distance.

### Request

```json
{
  "radiusKm": 50,
  "experience": "senior",
  "specialization": "mobileDeveloper",
  "skills": ["Flutter", "Firebase"],
  "cursor": null,
  "limit": 10
}
```

| Field | Type | Meaning |
|---|---|---|
| `radiusKm` | `int` | `5..300`. The server clamps it. |
| `experience` | `EExperience name \| null` | Same meaning as the deck's Firestore filter. |
| `specialization` | `ESpecialization name \| null` | Same meaning as the deck's Firestore filter. |
| `skills` | `string[]` | Skill names, max 10, matched as "has **any** of". |
| `cursor` | `string \| null` | `null` for the first page. After that, the exact `nextCursor` from the previous response. It is opaque. |
| `limit` | `int` | Page size, clamped to `1..20`. |

The client never sends the Distance and City modes together. They are
mutually exclusive in the filter UI.

### Response

```json
{
  "items": [
    {
      "uid": "uA",
      "avatarUrl": "https://…",
      "avatarPath": "users/uA/avatar_1758….jpeg",
      "firstName": "Anna",
      "lastName": "K.",
      "age": 29,
      "aboutMe": "…",
      "profiler": {
        "specialization": "mobileDeveloper",
        "role": "…",
        "experience": "senior",
        "searchingSpecializations": ["backendDeveloper"],
        "skills": [{ "name": "Flutter" }]
      },
      "location": { "country": "Ukraine", "city": "Kyiv", "countryCode": "UA",
                    "countryKey": "ukraine", "cityKey": "kyiv",
                    "hasCoordinates": true },
      "createdAt": "2026-05-01T10:00:00Z",
      "lastSeen": "2026-09-27T13:50:00Z",
      "isOnline": false,
      "isDeleted": false,
      "distanceKm": 3.4
    }
  ],
  "nextCursor": "opaque…",
  "hasMore": true
}
```

- Each item carries **the same public fields as `users/{uid}`**, with the same
  names and nesting, so the client maps it onto its existing `UserData`.
  `createdAt` and `lastSeen` are **ISO-8601 UTC strings** here, not Firestore
  Timestamps.
- `distanceKm` follows the rounding rules in §3.
- **Order:** nearest first, ties broken by uid, so the order is stable across
  pages.
- **Exclusions:** the same as the deck.
  - the caller themself;
  - users the caller already answered (liked or rejected);
  - deleted users (`isDeleted == true`);
  - blocked users, in either direction;
  - users without stored coordinates.
- **Paging:** keyset on `(distance, uid)`, with no offsets. An item must never
  appear on two pages of the same search.
- **Implementation is the backend's choice** (e.g. geohash ranges around the
  caller's stored position, then exact haversine filtering and sorting). The
  only requirement is that a page is never short because of post-filtering,
  except the last page.

### Errors

| Code | When | Client behaviour |
|---|---|---|
| `failed-precondition` | The **caller** has no stored coordinates. | Shows the message returned ("Set your location in Edit Profile first"), and the deck shows its error/empty state. |
| `invalid-argument` | Bad `radiusKm` type, too many skills, or an invalid or foreign cursor. | The deck shows its error state. The filter can be reapplied. |
| `resource-exhausted` | Rate limit hit (suggested ≤ 60 calls per minute). | Same as `invalid-argument`. |
| `unauthenticated`, `unavailable`, `deadline-exceeded`, `internal` | The usual meanings. | Same as `invalid-argument`. |

Every failure must be an `HttpsError`. Never return a success payload with
an error flag.

## 5. City filter mode (client-side Firestore query)

The **City** mode runs on the client, as the rest of the deck filter does:

```
users
  where location.countryKey == "<country lowercased>"
  [where location.cityKey    == "<city lowercased>"]    // only when a city is given
  [+ the existing profiler.experience / profiler.specialization / profiler.skills clauses]
```

**Required composite indexes.** Deploy them together with the existing deck
indexes:

- `location.countryKey ASC, createdAt DESC`
- `location.countryKey ASC, location.cityKey ASC, createdAt DESC`
- each of the two combined with `profiler.experience` and/or
  `profiler.specialization` (the combinations the deck already indexes).

Without these, the query fails and the deck shows its error state.

## 6. Security rules

```
match /users/{uid} {
  // Existing rules still apply. Additionally, clients may not change
  // location.hasCoordinates; only the backend (Admin SDK) sets it.
  allow update: if request.auth.uid == uid
    && request.resource.data.get('location', {}).get('hasCoordinates', false)
       == resource.data.get('location', {}).get('hasCoordinates', false);
}

// Wherever the backend stores coordinates (its own choice), deny all
// client access, for example:
match /<coordinatesCollection>/{doc} {
  allow read, write: if false;
}
```

Merge the `hasCoordinates` guard into the existing `users` update rule rather
than replacing that rule.

## 7. Client behaviour summary

| Surface | What the client does | Data source |
|---|---|---|
| Edit Profile / Onboarding | Country and City text inputs, plus "📍 Use my location" (GPS permission → position → reverse-geocode → fills the inputs). Save writes `location` (§1). If a position was taken in that session, it then calls `updateUserCoordinates` (§2). | Device GPS plus the platform geocoder |
| Home filter: City | Country + City text, sent as Firestore equality on `countryKey` / `cityKey` (§5). | Firestore |
| Home filter: Distance | A slider from 5 to 300 km. Disabled until `location.hasCoordinates` is true. Calls `searchNearbyCandidates` (§4). | Callable |
| Home card | "📍 City, Country · ~X km". City and country come from `location`. Distance comes from §3, or from `distanceKm` in Distance mode. | Firestore + callable |
| Liked-you card | The same line. `city`, `country` and `distanceKm` come in the feed item. | `getLikedYou` (see the Liked-you contract §5) |

Distance display: `0.5` → "< 1 km"; under 10 → one decimal ("3.4 km"); under 500
→ rounded ("127 km"); 500 and above → "500+ km".

**Web:** reverse geocoding is unavailable, so "Use my location" still sends
coordinates, but the user types country and city. The behaviour is otherwise
the same.

## 8. Backend checklist

- [ ] `updateUserCoordinates` is deployed: auth-only, validates input, keeps the
  latest position per user in server-only storage, sets
  `location.hasCoordinates`, and is rate limited.
- [ ] Coordinates never appear in any response, error or log. The
  coordinates storage denies all client access.
- [ ] `getCandidateDistances` is deployed: ≤ 20 uids, 0.1 km rounding, the
  `0.5` floor, `null` for unknown or unlocatable users, rate limited.
- [ ] `searchNearbyCandidates` is deployed: clamps the radius and limit, applies
  the deck's filters and exclusions, orders nearest first with a keyset
  cursor, pages are never short except the last, ISO dates, and
  `failed-precondition` when the caller has no coordinates.
- [ ] The `users` update rule forbids clients from changing
  `location.hasCoordinates`.
- [ ] The composite indexes from §5 are deployed.
- [ ] The Liked-you feed returns `city`, `country` and `distanceKm` per its
  contract §5.
- [ ] Account deletion also deletes the user's stored coordinates.
