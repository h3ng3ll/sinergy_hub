import '../repositories/i_notification_repository.dart';
import '../models/notification/notification.dart';

class SaveNotificationUseCase {
  final INotificationRepository _notificationRepository;

  SaveNotificationUseCase({
    required INotificationRepository notificationRepository,
  }) : _notificationRepository = notificationRepository;

  Future<Notification> call({
    required Notification notification,
  }) async {
    final res = await _notificationRepository.create(
      notification: notification,
    );
    return res;
  }
}
