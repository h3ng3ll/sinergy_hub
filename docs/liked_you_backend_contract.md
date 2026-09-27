# "Liked you" Feed — Backend Contract

This document is the contract between the Flutter client and the backend
(Cloud Functions) for the **Liked you** bottom-bar tab: the paginated list of
people who liked the current user and whom the current user has **not
answered yet** (one-way likes waiting on them).

**The backend is the only authority for gating.** The client never blurs an
image, never decrypts anything, never counts reveals, and never re-checks
premium. It renders exactly what the callable returns:

- which items are locked,
- which image URL each item carries (clear or server-blurred),
- which profile fields are present.

Anything the server does not want a Free user to see must simply **not be
in the response**.

Related: `docs/subscription_backend_contract.md` (premium entitlement,
`subscriptions/{uid}`, `matchUser`).

## 1. Terms

| Term | Meaning |
|---|---|
| **viewer** | The authenticated caller (`request.auth.uid`). |
| **liker** | A user who sent `matchUser { status: 'liked' }` targeting the viewer. |
| **pending like** | A like from a liker that the viewer has neither liked back nor rejected. Once the viewer answers, the like leaves this feed (a like-back becomes a two-way match, which is handled by the existing match flow). |
| **premium** | `subscriptions/{viewer}.isActive == true && expiresAt > now`. This is re-checked on the server on **every** call, exactly like `matchUser` (subscription contract §4). |
| **reveal** | A pending like that a Free viewer is allowed to see in the clear during the current quota period. |
| **locked item** | A pending like the viewer is not allowed to see in the clear. |

## 2. Data source

Likes are written by the existing `matchUser` callable into the top-level
`matches` collection. Each match doc has id `uidA_uidB`, and the client
already reads the fields `users`, `answeredUids`, `completeness`
(`none|oneWayMatch|twoWayMatch`), `matchStatus` and `time`.

A document belongs in the viewer's feed when **all** of these hold:

1. `users` contains the viewer.
2. The *other* uid liked (it is in `answeredUids` with a `liked` answer).
3. The viewer is **not** in `answeredUids`.
4. `completeness == 'oneWayMatch'`. A rejected pair never appears.
5. The liker's user doc exists and has `isDeleted == false`.
6. Neither user has blocked the other.
7. Neither user is suppressed by moderation (reports).

**Required denormalization.** Firestore cannot query "array does *not*
contain". Filtering on condition 3 after the query would produce short or
empty pages and break pagination. So `matchUser` must maintain a
queryable field on the match doc:

| Field | Type | Set when | Cleared when |
|---|---|---|---|
| `pendingFor` | `string \| null` | The first like of a pair lands: set to the **target's** uid. | The target answers (like-back or reject), or either user is deleted or blocked: set to `null`. |
| `likedAt` | `timestamp` | Same moment as `pendingFor` (the liker's like time). | Never. |

Feed query:
`matches where pendingFor == viewer orderBy likedAt desc, __name__ desc limit (limit + 1)`.
This needs a composite index on `pendingFor ASC, likedAt DESC`.
Fetching `limit + 1` is how `hasMore` is computed without an extra
request.

Conditions 5–7 are cheap per-item checks. An item that fails them must be
**dropped and replaced from the next documents** so that a page is never
short. Only the last page may contain fewer than `limit` items.

## 3. Callable `getLikedYou`

HTTPS callable in the default region, the same as `matchUser` / `reportUser`.
**Auth is required.** An unauthenticated call → `unauthenticated`.

### Request

```json
{ "limit": 20, "cursor": null }
```

| Field | Type | Required | Meaning |
|---|---|---|---|
| `limit` | `int` | no (default `20`) | Page size. The server **clamps** it to `1..50`; it is never trusted as sent. |
| `cursor` | `string \| null` | no | `null`/absent = first page. Otherwise the exact `nextCursor` string from the previous response. |

### Cursor rules

- **Opaque to the client.** Suggested encoding: base64url of
  `{"t": <likedAt millis>, "id": "<matchDocId>"}`, used with
  `startAfter(likedAt, __name__)`.
- **Keyset, never offset.** A new like arriving while the viewer scrolls
  must not duplicate or skip items on later pages. New likes appear at the
  top on the next refresh (cursor `null`).
- **An invalid, tampered or foreign cursor → `invalid-argument`.** The client
  then reloads from the first page.
- The cursor carries **no authority**. Lock state and quota are recomputed
  on every call, so a cursor saved while the viewer was premium does not
  unlock anything after the subscription expires.

## 4. Response envelope

```json
{
  "items": [ /* LikedYouItem, see §5 */ ],
  "nextCursor": "eyJ0IjoxNzU4OTY...",
  "hasMore": true,
  "totalCount": 37,
  "isPremium": false,
  "quota": {
    "period": "daily",
    "limit": 3,
    "used": 1,
    "remaining": 2,
    "resetsAt": "2026-09-28T00:00:00Z",
    "isUnlimited": false
  }
}
```

| Field | Type | Meaning |
|---|---|---|
| `items` | `LikedYouItem[]` | This page, in `likedAt desc` order. It may be empty only when the whole feed is empty. |
| `nextCursor` | `string \| null` | The cursor for the next page. `null` exactly when `hasMore == false`. |
| `hasMore` | `bool` | Whether another page exists. The client stops requesting pages once this is `false`. |
| `totalCount` | `int` | All pending likes of the viewer, locked ones included. It may be an approximate count (e.g. a Firestore `count()` aggregate), but it must never be negative. |
| `isPremium` | `bool` | The server's own premium decision for **this** call. It is informational; the client does not gate on it. |
| `quota` | `object \| null` | `null` for premium viewers. For Free viewers it is always present, including on later pages. |

### `quota`

| Field | Type | Meaning |
|---|---|---|
| `period` | `"daily" \| "weekly"` | The reveal window. The value is server config (see §7). |
| `limit` | `int` | Clear reveals allowed per period. |
| `used` | `int` | Reveals already assigned in this period. |
| `remaining` | `int` | `max(limit - used, 0)`. |
| `resetsAt` | `ISO-8601 UTC string \| null` | When the period rolls over. `null` only when `isUnlimited`. |
| `isUnlimited` | `bool` | `true` means no reveal limit applies. The client hides the quota banner. |

The client shows its banner only when `quota != null && !quota.isUnlimited`
**and** `PremiumBloc` (Firestore `subscriptions/{uid}`) reports Free. That
banner reads "`remaining` of `limit` reveals left · resets `resetsAt`" and
has an Upgrade button.

## 5. `LikedYouItem`

```json
{
  "likeId": "uidLiker_uidViewer",
  "likedAt": "2026-09-27T09:14:02Z",
  "isLocked": false,
  "imageState": "clear",
  "imageUrl": "https://storage.googleapis.com/...signed...",
  "uid": "uidLiker",
  "firstName": "Anna",
  "age": 29,
  "specialization": "mobileDeveloper",
  "experience": "senior",
  "skills": [ { "name": "Flutter" }, { "name": "Firebase" } ],
  "city": "Kyiv",
  "country": "Ukraine",
  "distanceKm": 3.4
}
```

| Field | Type | Unlocked item | Locked item |
|---|---|---|---|
| `likeId` | `string` | The match doc id. Stable, and unique within the feed; the client de-duplicates pages by it. | Same value. It is needed for de-duplication, and it reveals nothing if it is opaque. **If** the doc id embeds the liker's uid, send an opaque id instead (e.g. an HMAC of the doc id). |
| `likedAt` | `ISO-8601 UTC string` | Required. | Required. It may be coarsened to the hour or day if exact timing is considered sensitive. |
| `isLocked` | `bool` | `false` | `true` |
| `imageState` | `"clear" \| "blurred" \| "none"` | `clear`, or `none` when the liker has no avatar. | `blurred`, or `none` when the liker has no avatar. |
| `imageUrl` | `string \| null` | Signed URL of the **original** primary image (see §6). | Signed URL of the **server-blurred** derivative. **Never** the clear URL, and never a URL that can be transformed into it. |
| `uid` | `string \| null` | The liker's uid. | **MUST be `null`/omitted.** |
| `firstName` | `string \| null` | First name. | `null`/omitted. |
| `age` | `int \| null` | Age. | `null`/omitted, or rounded to a range if product wants a teaser. The client renders whatever is present. |
| `specialization` | `string \| null` | An `ESpecialization` name (below). | Optional teaser; product decides. `null` hides it. |
| `experience` | `string \| null` | An `EExperience` name (below). | Optional teaser; product decides. `null` hides it. |
| `skills` | `{name: string}[]` | Up to 3 skills, shown as chips (the client also caps at 3). | `[]` |
| `city` | `string \| null` | The liker's public `users/{uid}.location.city`. | Optional teaser; product decides. `null` hides it. |
| `country` | `string \| null` | The liker's public `users/{uid}.location.country`. | Optional teaser; product decides. `null` hides it. |
| `distanceKm` | `number \| null` | The distance between the viewer's and the liker's **stored** coordinates, computed with the rounding and `0.5` floor rules of `docs/location_backend_contract.md` §3. `null` if either side has no coordinates. | **MUST be `null`/omitted.** An exact distance plus a city would help identify a locked liker. |

**Surname, `aboutMe`, `avatarPath`, `lastSeen`, `isOnline`, contact data and
any coordinates are never sent in this feed**, locked or not. Only the
server-computed `distanceKm` is sent, never a position.

Enum values must be the exact Dart enum names the client already parses:

- `ESpecialization`: `frontendDeveloper`, `mobileDeveloper`,
  `backendDeveloper`, `fullStackDeveloper`, `devopsEngineer`,
  `dataScientistMLEngineer`, `qaTestAutomation`, `techLeadCTO`,
  `productManager`, `productOwner`, `uiUxDesigner`, `productDesigner`,
  `marketingManager`, `growthManager`, `salesManager`, `businessDeveloper`,
  `technicalCoFounder`, `nonTechnicalCoFounder`.
- `EExperience`: `junior`, `middle`, `senior`.

An unknown enum value is treated by the client as `null`, so it hides that
field rather than failing.

**Client parsing is strict on types.** The client decodes the envelope and every
item with generated `fromJson`. Unknown **enum** values are tolerated as
described above, and optional fields may be omitted. A required field that is
missing or mistyped fails the **whole page** and shows the error view with Retry:

- `likeId`, `likedAt` or `isLocked` on any item;
- `hasMore` on the envelope;
- a number sent as a string.

The server must therefore validate every item before sending it and drop any it
cannot serialize correctly (see §2 refill rule).

## 6. Image rules (server-side only)

- **Primary image** = the liker's avatar: `users/{uid}.avatarPath` in
  Firebase Storage (`avatarUrl` is its download URL). Only one image per user
  exists today. If a gallery is added later, the primary image is the one
  flagged primary, and this contract still sends only that one.
- **Clear variant.** This is a **V4 signed URL** to the original object, with a
  short TTL (recommended 1 h). It must not be the permanent `avatarUrl`
  download-token URL, which would stay valid forever once leaked.
- **Blurred variant.** It is generated by the server and stored in Storage, e.g.
  `avatars_blurred/{uid}.jpg`: downscaled to about 64 px on the long edge,
  Gaussian blur σ ≥ 12, re-encoded as JPEG. It is (re)built by a Storage
  trigger on avatar upload or replace, and deleted with the avatar. It is
  served as a signed URL with the same TTL. It must be irreversible, so never
  send the original with a "blur me" hint.
- **Security rule.** The client cannot read `avatars_blurred/**` directly
  (`allow read, write: if false;`). Access only goes through the signed URLs
  the function issues.
- **Caching.** The client caches images by URL (`CachedNetworkImage`). A new
  signed URL means a new cache entry, which is fine: a Free→Premium upgrade
  naturally swaps blurred → clear on the next response. Set
  `Cache-Control: private, max-age=3600` on both variants.
- **Missing avatar.** Send `imageState: "none"`, `imageUrl: null`. The client
  shows its default user placeholder.

## 7. Quota semantics (Free viewers)

- **Config.** `period` (`daily` | `weekly`) and `limit` come from server
  config, e.g. Remote Config or a `config/likedYou` doc, **not** from the
  client. Suggested defaults are `weekly` and `3`. Periods are keyed in UTC:
  `2026-09-27` for daily, ISO week `2026-W39` for weekly.
- **Deterministic reveals.** Which pending likes are revealed in a period must
  be **stable**. Paging, refreshing or reinstalling must never reshuffle which
  cards are clear. Suggested approach:
  - The first time the viewer calls in a period, pick up to `limit` pending
    likes (newest first) and store their doc ids in
    `likedYouReveals/{viewer}_{periodKey}` as `{ likeIds: [...], createdAt }`.
  - On every later call in that period, an item is unlocked **iff** its id is
    in that set.
  - `used = likeIds.length`, `remaining = limit - used`.
  - If a revealed like leaves the feed (the viewer answered it), it keeps
    counting as `used` for that period and is not replaced.
- **Premium viewers.** Every item is unlocked, `quota: null`, and reveals are
  not recorded.
- **Premium expiry.** The next call recomputes the viewer as Free. Items
  outside the current period's reveal set are locked again. Nothing
  previously sent grants lasting access, because clear URLs are short-lived
  (§6).

## 8. Errors

Throw `HttpsError` with these codes. The client maps them through
`FirebaseFunctionsService`'s typed exceptions.

| Code | When | Client behavior |
|---|---|---|
| `unauthenticated` | No or invalid auth. | Full error view; the auth redirect handles the session. |
| `invalid-argument` | Bad `limit` type, or an invalid, foreign or expired cursor. | Reloads from the first page. If that fails too, shows the error view with Retry. |
| `resource-exhausted` | Rate limit hit (§9). | First page: error view with Retry. Next page: inline "Couldn't load more · Retry" footer, and loaded items stay. |
| `unavailable` / `deadline-exceeded` | Transient backend or network issue. | Same as `resource-exhausted`, with a "check your connection" message. |
| `internal` / anything else | Bug. | Same, with a generic message. |

**Never return a success payload with an error flag** (unlike the legacy
`matchUser` `{success:false}` shape). Every failure is an `HttpsError`, so
that the client has exactly one failure path.

Until this function is deployed, the client receives `not-found` and shows
the error view with Retry. That is expected and does not crash.

## 9. Limits and protection

- The page size is clamped to `1..50` on the server.
- Rate limit per viewer: suggested ≤ 60 calls per minute. The client only
  requests the next page when the scroll comes within 300 px of the end, and
  drops duplicate load-more requests while one is in flight.
- Log the viewer uid, page number, item count, locked count and latency.
  Never log signed URLs.
- Firestore rules:

```
match /likedYouReveals/{docId} {
  allow read, write: if false;   // server-only
}
```

  The `matches` rules are unchanged. The client must not be able to read
  another user's `pendingFor` feed directly.

## 10. Examples

### Free viewer, first page (limit 3)

Request: `{ "limit": 3, "cursor": null }`

```json
{
  "items": [
    { "likeId": "a1", "likedAt": "2026-09-27T09:14:02Z", "isLocked": false,
      "imageState": "clear", "imageUrl": "https://…/avatars/uA.jpg?X-Goog-Signature=…",
      "uid": "uA", "firstName": "Anna", "age": 29,
      "specialization": "mobileDeveloper", "experience": "senior",
      "skills": [{ "name": "Flutter" }, { "name": "Firebase" }],
      "city": "Kyiv", "country": "Ukraine", "distanceKm": 3.4 },
    { "likeId": "b2", "likedAt": "2026-09-27T07:40:11Z", "isLocked": true,
      "imageState": "blurred", "imageUrl": "https://…/avatars_blurred/uB.jpg?X-Goog-Signature=…",
      "uid": null, "firstName": null, "age": null,
      "specialization": "backendDeveloper", "experience": null, "skills": [],
      "city": "Lviv", "country": "Ukraine", "distanceKm": null },
    { "likeId": "c3", "likedAt": "2026-09-26T21:02:45Z", "isLocked": true,
      "imageState": "none", "imageUrl": null,
      "uid": null, "firstName": null, "age": null,
      "specialization": null, "experience": null, "skills": [] }
  ],
  "nextCursor": "eyJ0IjoxNzU4OTIwNTY1MDAwLCJpZCI6ImMzIn0",
  "hasMore": true,
  "totalCount": 7,
  "isPremium": false,
  "quota": { "period": "weekly", "limit": 3, "used": 1, "remaining": 2,
             "resetsAt": "2026-09-28T00:00:00Z", "isUnlimited": false }
}
```

### Premium viewer, next page

Request: `{ "limit": 20, "cursor": "eyJ0IjoxNzU4OTIwNTY1MDAwLCJpZCI6ImMzIn0" }`

```json
{
  "items": [
    { "likeId": "d4", "likedAt": "2026-09-25T18:00:00Z", "isLocked": false,
      "imageState": "clear", "imageUrl": "https://…/avatars/uD.jpg?X-Goog-Signature=…",
      "uid": "uD", "firstName": "Marek", "age": 34,
      "specialization": "techLeadCTO", "experience": "senior",
      "skills": [{ "name": "Kubernetes" }],
      "city": "Warsaw", "country": "Poland", "distanceKm": 690.2 }
  ],
  "nextCursor": null,
  "hasMore": false,
  "totalCount": 4,
  "isPremium": true,
  "quota": null
}
```

### Empty feed

```json
{ "items": [], "nextCursor": null, "hasMore": false, "totalCount": 0,
  "isPremium": false,
  "quota": { "period": "weekly", "limit": 3, "used": 0, "remaining": 3,
             "resetsAt": "2026-09-28T00:00:00Z", "isUnlimited": false } }
```

## 11. Live updates — `likedYouMeta/{uid}` signal document

A callable cannot push, so the client learns about feed changes from a tiny
Firestore document that it **listens** to. The document carries **no feed data
and no gating decisions**, only a change signal. On every change, the client
re-calls `getLikedYou` with `cursor: null` and replaces the list with the
fresh first page. Pagination and every gating rule stay in the callable.

Read-only for the client. It is written **only** by the backend.

| Field | Type | Meaning |
|---|---|---|
| `pendingCount` | `int` | Current number of pending likes for `uid`, i.e. the same total as `totalCount`. |
| `updatedAt` | `timestamp` (server) | Bumped on **every** change listed below. The client re-fetches on any change of the document. |

Write it (`set` with merge; `pendingCount` recomputed or incremented, and
`updatedAt: FieldValue.serverTimestamp()`) in the same transaction or batch as
the match-doc change, whenever:

1. a new like targets `uid` (`pendingFor` set to `uid`);
2. `uid` answers a pending like (like-back or reject; `pendingFor` cleared);
3. a liker is deleted or blocked, or blocks `uid`;
4. `uid`'s reveal set changes for a reason other than paging (e.g. an
   admin reset). A new quota period does **not** need a write: the client
   picks it up on its next fetch.

Rules for the writer:

- Bump **at most once per logical change**. Batch fan-outs (e.g. deleting a
  user who liked many people) must write each affected `likedYouMeta` doc once,
  not once per match doc.
- Never put names, uids or image URLs in this document. It is readable by its
  owner even when they are Free.
- A missing document is valid (no likes yet). The client treats it as "no
  signal" and still shows the feed from the callable.

Client behaviour the backend should expect:

- The listener ignores the first snapshot it receives, because the initial
  `getLikedYou` load already covers it.
- Each later change triggers one first-page fetch. A burst of changes while a
  fetch is in flight is processed in order, one fetch per change. Keep bumps
  coalesced (rule above) to avoid extra calls.
- If the listener errors, the client stops live updates silently.
  Pull-to-refresh and Retry keep working.

Firestore rule:

```
match /likedYouMeta/{uid} {
  allow read: if request.auth != null && request.auth.uid == uid;
  allow write: if false;   // server-only
}
```

## 12. Responding from the feed (like / reject)

Unlocked cards carry **Like** and **Reject** buttons. Both call the
**existing** `matchUser` callable, exactly as the swipe deck does. No new
endpoint is needed:

```json
{ "matchId": "<liker uid>", "status": "liked" }   // or "reject"
```

`matchId` is the **liker's uid**. This is why unlocked items must carry `uid`
(§5). Locked items have no `uid`, so the client shows no buttons on them, and
the server must reject a `matchUser` call for a pair the viewer could only see
locked.

`matchUser` must, **in the same transaction** as the match-doc write:

| Answer | Match doc | `likedYouMeta/{viewer}` |
|---|---|---|
| `liked` | `completeness: "twoWayMatch"`, viewer added to `answeredUids`, `pendingFor: null`, `alreadyNotified.<viewer>: false` and `alreadyNotified.<liker>: false` | Bumped (§11) |
| `reject` | Viewer added to `answeredUids`, `pendingFor: null`. It must **never** become `twoWayMatch`. | Bumped (§11) |

- `alreadyNotified.<viewer> == false` is what makes the client's existing
  two-way-match listener open the match screen right after a like-back.
- The daily like limit applies to like-backs exactly as to deck likes. It
  keeps the legacy `{ "success": false, "status": "failed" }` response when
  exceeded, because that is what the shared client use case parses. The client
  puts the card back and opens the paywall.
- Any thrown error puts the card back and shows an error message.

Client behaviour: the card is removed **optimistically** on tap. It is
restored at its original position only if `matchUser` fails. The following
§11 signal then re-fetches the first page, which confirms the removal.

## 13. Backend checklist

- [ ] `matchUser` maintains `pendingFor` and `likedAt` on match docs (set on
  the first like, cleared on answer, delete or block). Existing
  `oneWayMatch` docs are backfilled.
- [ ] Composite index `matches(pendingFor ASC, likedAt DESC)` is deployed.
- [ ] The `getLikedYou` callable is deployed: auth required, `limit` clamped,
  keyset cursor, `limit + 1` fetch for `hasMore`, pages refilled after
  per-item exclusions.
- [ ] Premium is re-checked on the server from `subscriptions/{uid}`
  (`isActive && expiresAt > now`) on every call.
- [ ] A Storage trigger builds `avatars_blurred/{uid}.jpg` on avatar
  upload/replace and deletes it with the avatar. Existing avatars are
  backfilled.
- [ ] Clear and blurred images are served only as short-lived V4 signed URLs.
  Locked items never carry a clear URL, `uid` or name.
- [ ] Quota config (`period`, `limit`) lives in Remote Config or `config/likedYou`,
  and the reveal set is persisted in `likedYouReveals/{viewer}_{periodKey}`.
- [ ] Every failure is an `HttpsError` using the codes in §8. There are no
  `{success:false}` payloads.
- [ ] Rules deployed: `likedYouReveals/**` and `avatars_blurred/**` are
  server-only.
- [ ] Per-viewer rate limit and structured logging, with no signed URLs in
  the logs.
- [ ] `matchUser` handles feed responses per §12: it clears `pendingFor`, sets
  `twoWayMatch` and `alreadyNotified` on a like-back, bumps `likedYouMeta`,
  and refuses pairs that were only visible locked.
- [ ] Items carry `city`, `country` and `distanceKm` per §5. Locked items never
  carry `distanceKm`, and no item ever carries coordinates.
- [ ] `likedYouMeta/{uid}` (`pendingCount`, `updatedAt`) is written in the same
  transaction as every feed-changing event in §11, coalesced to one bump per
  logical change. It has an owner-read, server-write rule. Existing users are
  backfilled.
