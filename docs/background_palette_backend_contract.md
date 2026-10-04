# Background Palette — Backend Contract

This document is the contract between the Flutter client and the backend for
the **Premium background palette**. A Premium user can pick two colors, and
those colors drive the app's animated background shader.

**The backend is the only authority for gating.** The client never writes the
palette document. Every change goes through the `setBackgroundPalette`
callable, which re-checks premium on the server on **every** call. A Free
user therefore cannot store a palette, even with a modified client.

Related: `docs/subscription_backend_contract.md` (premium entitlement,
`subscriptions/{uid}`).

## 1. Terms

| Term | Meaning |
|---|---|
| **caller** | The authenticated user, `request.auth.uid`. |
| **premium** | `subscriptions/{caller}.isActive == true && expiresAt > now`. This is the same check `matchUser` and `getLikedYou` use (subscription contract §4). |
| **color** | An 8-digit `AARRGGBB` hex string without `#`, e.g. `"FF9966FF"`. |

## 2. Firestore document — `users/{uid}/appearance/palette`

The client may only read this document. It is written **only** by
`setBackgroundPalette`.

| Field | Type | Meaning |
|---|---|---|
| `primary` | `string` (color) | First gradient color. |
| `secondary` | `string` (color) | Second gradient color. |
| `updatedAt` | `timestamp` | Server time of the last write. The client ignores it. |

If the document is missing, the user is on the **default palette**. The
client does not apply a stored palette while the user is not premium. It
keeps the palette and shows it again when the subscription is renewed.

## 3. Callable — `setBackgroundPalette`

### Request

The request takes exactly one of the two shapes below.

Set a palette:

```json
{ "primary": "FF9966FF", "secondary": "FFD959BF" }
```

Reset to the default:

```json
{ "reset": true }
```

### Server logic

1. **Auth.** If there is no `request.auth`, throw `unauthenticated`.
2. **Shape.** Throw `invalid-argument` if any of these is true:
   - `reset` is `true` and `primary` or `secondary` is also present;
   - `reset` is absent or false, and `primary` or `secondary` is missing;
   - `primary` or `secondary` doesn't match `^[0-9A-Fa-f]{8}$`.
3. **Reset** (`reset: true`): delete `users/{caller}/appearance/palette` and
   return `{ "palette": null }`.
   - This is **allowed for every authenticated user**, premium or not.
     Removing a customization is harmless, and it lets a lapsed subscriber
     clear their stored palette.
   - Deleting a missing document is a no-op success.
4. **Set:**
   1. Read `subscriptions/{caller}`. If the caller is **not premium** (see
      §1; a missing document counts as not premium), throw
      `permission-denied` with the message
      `"Background colors are a Premium feature."`.
   2. Normalize both colors: uppercase them, and force alpha to `FF` (the
      shader ignores alpha).
   3. `set` (overwrite) the document with
      `{ primary, secondary, updatedAt: serverTimestamp() }`.
   4. Return `{ "palette": { "primary": "...", "secondary": "..." } }` with
      the **normalized** values.

### Response

```json
{ "palette": { "primary": "FF9966FF", "secondary": "FFD959BF" } }
```

On reset, `palette` is `null`. The client treats `palette` as the stored
truth and caches exactly that value locally.

### Errors → client behavior

| Code | When | Client |
|---|---|---|
| `unauthenticated` | No auth | Reverts the change and shows an error. |
| `invalid-argument` | Bad shape or color | Reverts the change and shows an error. |
| `permission-denied` | Set while not premium | Reverts the change and shows "Background colors are a Premium feature." |
| `unavailable` / `deadline-exceeded` | Network | Reverts the change and shows an error. The user can try again. |
| anything else | — | Reverts the change and shows an error. |

On any error, the client never caches the rejected palette locally.

## 4. Firestore security rule

This rule goes inside `match /users/{userId}`. It **replaces** any earlier
rule that let the owner write this document.

```
match /appearance/palette {
  allow read: if request.auth != null && request.auth.uid == userId;
  allow write: if false;
}
```

## 5. Client behavior the backend should expect

- **Reads.**
  - The client reads the document directly, only when it has no local copy
    yet (fresh install, new device).
  - It then caches the result per user, including "default", so default
    users don't re-read on every launch.
- **Writes.**
  - A write happens only when a Premium user saves a color, or anyone taps
    Reset.
  - The client applies the change optimistically and reverts it if the
    callable fails.
  - It caches only the palette that the response returns.
- **Already gated in the UI.** A Free user tapping a color sees the paywall
  instead of the picker, so `permission-denied` should only happen for a
  stale client (e.g. a subscription that lapsed mid-session) or a tampered
  one.

## 6. Checklist

- [ ] `setBackgroundPalette` deployed in the same region the client calls
      (default `us-central1`).
- [ ] The premium check re-reads `subscriptions/{caller}` on every **set**
      call. Never trust anything the client sends.
- [ ] The §4 security rule is deployed (client write is `false`).
