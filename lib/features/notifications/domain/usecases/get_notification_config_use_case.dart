import '../../../auth/domain/repostories/i_auth_repository.dart';
import '../models/notification_config/notification_config.dart';
import '../repositories/i_notification_config_repository.dart';

class GetNotificationsConfigUseCase {
  final INotificationConfigRepository _notificationConfigRepository;
  final IAuthRepository _authRepository;

  GetNotificationsConfigUseCase({
    required INotificationConfigRepository notificationConfigRepository,
    required IAuthRepository authRepository,
  }) : _notificationConfigRepository = notificationConfigRepository,
       _authRepository = authRepository;

  Future<NotificationConfig?> call() async {
    final uid = await _authRepository.requireUserId();
    final res = await _notificationConfigRepository.get(
      uid: uid,
    );
    return res;
  }
}
