import '../models/premium_status/premium_status.dart';

/// Read-only access to the backend-owned premium entitlement document.
abstract class IPremiumStatusRepository {
  /// Emits `null` when the user has no `subscriptions/{uid}` document, which
  /// means Free.
  Stream<PremiumStatus?> watch(String uid);

  /// The signed-in user's `subscriptions/{uid}` document, live for the whole
  /// session: every create / update / delete emits, and the listener follows
  /// sign-in, sign-out and account swaps. Emits `null` when the document is
  /// missing or deleted.
  Stream<PremiumStatus?> watchCurrent();
}
