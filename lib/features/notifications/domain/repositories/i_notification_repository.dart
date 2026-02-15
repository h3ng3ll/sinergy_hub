import '../models/notification/notification.dart';

abstract class INotificationRepository {
  Future<List<Notification>> get({
    required String uid,
  });

  Future<Notification> create({
    required String uid,
    required Notification notification,
  });
}
