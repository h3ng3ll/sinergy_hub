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
    final doc =  _firebaseFirestoreService.notificationConfig(
      uid: uid,
    );
    final isExists = await _firebaseFirestoreService.isExistsDocument(
      doc,
    );
    if (!isExists) return null;

    final configData = await doc.get();

    final config = NotificationConfig.fromJson(
      configData.data()!,
    );
    return config;
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
          config.toJson(),
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
