import 'package:dartz/dartz.dart';

import '../../../auth/domain/repostories/i_auth_repository.dart';
import '../failures/notification_config_failures.dart';
import '../failures/save_notification_config_failure.dart';
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

  Future<Either<void, NotificationConfigFailure>> call({
    required NotificationConfig config,
  }) async {
    try {
      final uid = await _authRepository.requireUserId();
      await _notificationConfigRepository.update(
        config: config,
        uid: uid,
      );
      return Left(null);
    } catch (_) {
      return Right(SaveNotificationConfigFailure());
    }
  }
}
