import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../core/services/firebase/firebase_firestore_service.dart';
import '../../domain/models/notification_config/notification_config.dart';
import '../../domain/repositories/i_notification_config_repository.dart';

class NotificationConfigFirebaseRepository
    implements INotificationConfigRepository {
  final FirebaseFirestoreService _firebaseFirestoreService;

  NotificationConfigFirebaseRepository({
    required FirebaseFirestoreService firebaseFirestoreService,
  }) : _firebaseFirestoreService = firebaseFirestoreService;

  @override
  Future<NotificationConfig?> get({
    required String uid,
  }) async {
    /// Server read: the token-registration skip decision is made against
    /// this snapshot, so a stale local-cache copy must never be trusted.
    final snap = await _firebaseFirestoreService
        .notificationConfig(uid: uid)
        .get(const GetOptions(source: Source.server));
    final data = snap.data();
    if (!snap.exists || data == null) return null;

    return NotificationConfig.fromJson(data);
  }

  @override
  Future<void> update({
    required String uid,
    required NotificationConfig config,
  }) async {
    await _firebaseFirestoreService
        .notificationConfig(
          uid: uid,
        )
        .set(
          /// Only the field this writer owns — fcmTokens belongs to
          /// [upsertToken]; a full overwrite here would erase tokens with
          /// whatever stale copy the caller loaded.
          {'enabledNotifications': config.enabledNotifications},
          SetOptions(merge: true),
        );
  }

  @override
  Future<void> upsertToken({
    required String uid,
    required String platform,
    required String token,
  }) async {
    await _firebaseFirestoreService.notificationConfig(uid: uid).set(
          {
            'fcmTokens': {platform: token},
          },
          SetOptions(merge: true),
        );
  }
}
