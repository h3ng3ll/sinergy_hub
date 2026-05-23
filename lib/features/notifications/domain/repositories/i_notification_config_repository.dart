import '../models/notification_config/notification_config.dart';

abstract class INotificationConfigRepository {
  Future<NotificationConfig?> get({
    required String uid,
  });

  Future<void> update({
    required String uid,
    required NotificationConfig config,
  });

  Future<void> upsertToken({
    required String uid,
    required String platform,
    required String token,
  });
}
