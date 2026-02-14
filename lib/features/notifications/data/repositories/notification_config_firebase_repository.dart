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
    final configData = await _firebaseFirestoreService
        .notificationConfig(
          uid: uid,
        )
        .get();
    if (configData.data() == null) return null;

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
        .update(
          config.toJson(),
        );
  }
}
