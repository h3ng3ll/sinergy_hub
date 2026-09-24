import '../models/premium_status/premium_status.dart';

/// Read-only access to the backend-owned premium entitlement document.
abstract class IPremiumStatusRepository {
  /// Emits `null` when the user has no `subscriptions/{uid}` document, which
  /// means Free.
  Stream<PremiumStatus?> watch(String uid);
}
