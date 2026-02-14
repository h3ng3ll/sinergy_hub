import '../../../auth/domain/repostories/i_auth_repository.dart';
import '../models/notification_config/notification_config.dart';
import '../repositories/i_notification_config_repository.dart';

class SaveNotificationsConfigUseCase {
  final INotificationConfigRepository _notificationConfigRepository;
  final IAuthRepository _authRepository;

  SaveNotificationsConfigUseCase({
    required INotificationConfigRepository notificationConfigRepository,
    required IAuthRepository authRepository,
  }) : _notificationConfigRepository = notificationConfigRepository,
       _authRepository = authRepository;

  Future<void> call({
    required NotificationConfig config,
  }) async {
    final uid = await _authRepository.requireUserId();
    final res = await _notificationConfigRepository.update(
      config: config,
      uid: uid,
    );
    return res;
  }
}
