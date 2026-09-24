import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/models/premium_status/premium_status.dart';
import '../../domain/repositories/i_premium_status_repository.dart';

/// Backend-owned collection — the client only ever reads it.
/// See docs/subscription_backend_contract.md.
const String kSubscriptionsCollection = 'subscriptions';

class PremiumStatusFirestoreRepository implements IPremiumStatusRepository {
  final FirebaseFirestore _firestore;

  PremiumStatusFirestoreRepository({
    required this._firestore,
  });

  @override
  Stream<PremiumStatus?> watch(String uid) {
    return _firestore
        .collection(kSubscriptionsCollection)
        .doc(uid)
        .snapshots()
        .map((snapshot) {
          final data = snapshot.data();
          if (data == null) return null;
          try {
            return PremiumStatus.fromJson(data);
          } catch (_) {
            // A malformed document must never crash the app — treat it as
            // Free, same as a missing document.
            return null;
          }
        });
  }
}
