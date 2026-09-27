import '../../../../core/services/firebase/firebase_firestore_service.dart';
import '../../domain/models/liked_you_meta/liked_you_meta.dart';
import '../../domain/repositories/i_liked_you_meta_repository.dart';

class LikedYouMetaFirestoreRepository implements ILikedYouMetaRepository {
  final FirebaseFirestoreService _firebaseFirestoreService;

  LikedYouMetaFirestoreRepository({
    required this._firebaseFirestoreService,
  });

  @override
  Stream<LikedYouMeta?> watch() => _firebaseFirestoreService.authGated(
    (uid) => _firebaseFirestoreService
        .likedYouMeta(uid)
        .snapshots()
        .map((snapshot) {
          final data = snapshot.data();
          if (data == null) return null;
          try {
            return LikedYouMeta.fromJson(data);
          } catch (_) {
            // A malformed signal must not break the feed; it just means no
            // live refresh for this change.
            return null;
          }
        }),
  );
}
