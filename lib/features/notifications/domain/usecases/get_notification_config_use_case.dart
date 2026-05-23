import 'package:dartz/dartz.dart';

import '../../../auth/domain/repostories/i_auth_repository.dart';
import '../failures/load_notification_config_failure.dart';
import '../failures/notification_config_failures.dart';
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

  Future<Either<NotificationConfig?, NotificationConfigFailure>> call() async {
    try {
      final uid = await _authRepository.requireUserId();
      final config = await _notificationConfigRepository.get(uid: uid);
      return Left(config);
    } catch (_) {
      return Right(LoadNotificationConfigFailure());
    }
  }
}
