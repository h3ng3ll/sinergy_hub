import '../models/notification/notification.dart';

abstract class INotificationRepository {
  Future<List<Notification>> get();
  Future<Notification> create({
    required Notification notification
});
}
