# Premium Subscription — Backend Contract

This document is the contract between the Flutter client and the backend
(Cloud Functions + the RevenueCat webhook handler) for the Premium
subscription feature. The client never decides entitlement itself — it only
reads what the backend writes, and it enforces nothing server-side jobs are
responsible for.

## 1. Subscriber identity

- **RevenueCat app user id = Firebase uid.** The client calls
  `Purchases.logIn(uid)` right after the user is authenticated, and
  `Purchases.logOut()` on sign-out (skipped when RevenueCat's subscriber is
  already anonymous, since `logOut()` throws in that case).
- **Entitlement id: `hengell_pro`.** This must match the entitlement
  identifier configured in the RevenueCat dashboard exactly — see the
  checklist in section 7. (Confirmed against the live dashboard; it is
  **not** the generic `premium` placeholder used in earlier drafts of this
  doc.)

## 2. Firestore document — `subscriptions/{uid}`

Read-only for the client. Written **only** by the backend's RevenueCat
webhook handler.

| Field | Type | Meaning |
|---|---|---|
| `isActive` | `bool` | Whether the entitlement is currently active. |
| `entitlementId` | `string` | Always `"hengell_pro"` for this app. |
| `productId` | `string` | The store product/package identifier that granted the entitlement. |
| `store` | `string` | `APP_STORE` or `PLAY_STORE`. |
| `periodType` | `string` | `NORMAL`, `TRIAL`, or `INTRO`. |
| `expiresAt` | `timestamp` | When the current period ends. |
| `willRenew` | `bool` | Whether the subscription is set to auto-renew. |
| `updatedAt` | `timestamp` (server) | Set by the webhook handler on every write. |

**A missing document means Free.** The client's
`PremiumStatusFirestoreRepository.watch(uid)` treats both "no document" and
"document present but fails to parse" as `null`, i.e. Free — it never throws
in either case.

## 3. Webhook events → document effect

The webhook handler must apply RevenueCat's `INITIAL_PURCHASE`, `RENEWAL`,
`CANCELLATION`, `UNCANCELLATION`, `EXPIRATION`, `BILLING_ISSUE`,
`PRODUCT_CHANGE`, and `TRANSFER` events as follows:

| Event | Effect on `subscriptions/{uid}` |
|---|---|
| `INITIAL_PURCHASE` | Set `isActive: true`, `productId`, `store`, `periodType`, `expiresAt`, `willRenew: true`. |
| `RENEWAL` | Same as `INITIAL_PURCHASE` — refresh `expiresAt` and confirm `isActive: true`. |
| `UNCANCELLATION` | Set `willRenew: true` again (the user resumed auto-renew before expiry). |
| `PRODUCT_CHANGE` | Update `productId`/`periodType` to the new plan; `isActive` stays `true`. |
| `CANCELLATION` | Set `willRenew: false`. **Do not** flip `isActive` to `false` yet — the user stays entitled until `expiresAt` passes. |
| `EXPIRATION` | Set `isActive: false`. |
| `BILLING_ISSUE` | Leave `isActive: true` for the duration of RevenueCat's grace period; only expire it via a subsequent `EXPIRATION` event if the grace period elapses. |
| `TRANSFER` | Move the document's fields from the old uid to the new uid (RevenueCat sends both the transferred-from and transferred-to app user ids). |

Every event must be:

- **Authenticated** — verify RevenueCat's webhook authorization header
  before processing.
- **Idempotent** — RevenueCat retries webhook deliveries, so replaying the
  same event must not corrupt the document (e.g. key the write on the
  event's own timestamp/id, or always write the full resolved state rather
  than incrementing anything).

## 4. `matchUser` Cloud Function

`matchUser` already enforces the 20-likes-per-UTC-day free limit and
returns `{ success: false, status: 'failed' }` (mapped client-side to
`DailyMatchLimitExceededException`) once the limit is hit.

**Required change:** before applying the daily-limit check, read
`subscriptions/{uid}` (or the equivalent already-resolved entitlement state)
and skip the limit entirely when `isActive && expiresAt > now` —
**re-checked on the server**, never trusted from the client. A Free user
(`isActive` false, or the document missing) still gets `MatchFailure` /
`DailyMatchLimitExceededException` exactly as today once they hit 20 likes.

## 5. Firestore security rule

```
match /subscriptions/{uid} {
  allow read: if request.auth != null && request.auth.uid == uid;
  allow write: if false;
}
```

The client must never be able to write this document — entitlement is
decided exclusively by the webhook handler.

## 6. Client behavior the backend should expect

- **Right after a purchase completes**, the client treats RevenueCat's own
  `CustomerInfo.entitlements.active['hengell_pro']` as the source of truth
  for that single purchase flow and closes the paywall immediately — it does
  **not** wait for the Firestore document to update.
- **Ongoing premium status comes only from Firestore.** Because the webhook
  is asynchronous, there is a short window between "purchase succeeded in
  the client" and "`subscriptions/{uid}` reflects it."
- **A like blocked during that window** (the user is charged, but
  `matchUser` still sees them as Free because the document hasn't updated
  yet) simply re-opens the paywall — `MatchesBloc` treats it exactly like
  hitting the limit again. Tapping **Restore purchases** re-syncs
  RevenueCat and, once the webhook has caught up, resolves it. No data is
  lost — the user was never charged twice, and the next `matchUser` call
  after the document updates succeeds normally.

## 7. Client-side failures the backend/product team should be aware of

These never reach the backend — they are resolved entirely on-device and
shown in the paywall sheet:

- **Unavailable** — running on web, or the platform's RevenueCat API key is
  empty (keys are added later; the app must keep working with a blank key).
- **No plans found** — RevenueCat has no current offering, or the current
  offering has no packages configured.
- **Purchase cancelled** — the user backed out of the store's purchase
  sheet. Not treated as an error; the paywall stays open silently.
- **Payment pending** — e.g. a Google Play pending transaction awaiting
  approval (cash/carrier billing). Shown as an explicit "pending" message,
  not a failure.
- **Store/purchase error** — any other `PlatformException` from the store.
- **Restore: nothing to restore** — `Purchases.restorePurchases()`
  succeeded but the entitlement isn't active for this subscriber.

## 8. Setup checklist (RevenueCat dashboard + stores)

- [x] RevenueCat project has an entitlement identifier exactly `hengell_pro`
  (confirmed against the live dashboard/test-store purchase logs).
- [ ] A **current offering** is configured with at least one package
  (recommended: weekly/monthly/annual, with the annual package selected by
  default in the paywall sheet since it's pre-selected when present).
- [ ] The App Store Connect and Google Play Console subscription products
  are attached to their respective RevenueCat packages.
- [ ] The RevenueCat webhook is pointed at the backend's handler endpoint,
  with the authorization header/secret configured on both sides.
- [ ] `DEV_REVENUECAT_APPLE_API_KEY`, `DEV_REVENUECAT_GOOGLE_API_KEY`,
  `PROD_REVENUECAT_APPLE_API_KEY`, `PROD_REVENUECAT_GOOGLE_API_KEY` are
  populated in the real `.env` (never committed — see `.env.example` for the
  placeholder keys).
- [ ] iOS: the **In-App Purchase** capability is enabled for the app target
  in Xcode / App Store Connect.
- [ ] Android: `com.android.vending.BILLING` is present in
  `AndroidManifest.xml` (already present in this project).
- [ ] Firestore security rules deploy the `subscriptions/{uid}` rule from
  section 5.
