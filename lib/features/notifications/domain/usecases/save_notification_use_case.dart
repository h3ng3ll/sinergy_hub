import '../../../auth/domain/repostories/i_auth_repository.dart';
import '../models/notification/notification.dart';
import '../repositories/i_notification_repository.dart';

class SaveNotificationUseCase {
  final INotificationRepository _notificationRepository;
  final IAuthRepository _authRepository;

  SaveNotificationUseCase({
    required INotificationRepository notificationRepository,
    required IAuthRepository authRepository,
  }) : _notificationRepository = notificationRepository,
       _authRepository = authRepository;

  Future<Notification> call({
    required Notification notification,
  }) async {
    final uid = await _authRepository.requireUserId();
    final res = await _notificationRepository.create(
      notification: notification,
      uid: uid,
    );
    return res;
  }
}
