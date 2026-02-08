

import '../repositories/i_notification_repository.dart';
import '../models/notification/notification.dart';

class GetNotificationsUseCase {
  final INotificationRepository _notificationRepository;

  GetNotificationsUseCase({
    required INotificationRepository notificationRepository,
  }) : _notificationRepository = notificationRepository;

  Future<List<Notification>> call () async {
    final res = await _notificationRepository.get();
    return res;
  }
}
