import '../../../auth/domain/repostories/i_auth_repository.dart';
import '../models/notification/notification.dart';
import '../repositories/i_notification_repository.dart';

class GetNotificationsUseCase {
  final INotificationRepository _notificationRepository;
  final IAuthRepository _authRepository;

  GetNotificationsUseCase({
    required INotificationRepository notificationRepository,
    required IAuthRepository authRepository,
  }) : _notificationRepository = notificationRepository,
       _authRepository = authRepository;

  Future<List<Notification>> call() async {
    final uid = await _authRepository.requireUserId();
    final res = await _notificationRepository.get(
      uid: uid,
    );
    return res;
  }
}
