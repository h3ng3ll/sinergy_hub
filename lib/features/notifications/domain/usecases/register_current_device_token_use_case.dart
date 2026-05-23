import 'package:dartz/dartz.dart';

import '../../../../core/services/firebase/firebase_messaging_service.dart';
import '../../../auth/domain/repostories/i_auth_repository.dart';
import '../failures/notification_config_failures.dart';
import '../failures/register_device_token_failure.dart';
import '../models/notification_config/notification_config.dart';
import '../repositories/i_notification_config_repository.dart';

class RegisterCurrentDeviceTokenUseCase {
  final INotificationConfigRepository _notificationConfigRepository;
  final IAuthRepository _authRepository;
  final FirebaseMessagingService _firebaseMessagingService;

  RegisterCurrentDeviceTokenUseCase({
    required INotificationConfigRepository notificationConfigRepository,
    required IAuthRepository authRepository,
    required FirebaseMessagingService firebaseMessagingService,
  }) : _notificationConfigRepository = notificationConfigRepository,
       _authRepository = authRepository,
       _firebaseMessagingService = firebaseMessagingService;

  Future<Either<NotificationConfig, NotificationConfigFailure>> call({
    required NotificationConfig config,
  }) async {
    try {
      final platform = _firebaseMessagingService.platformKey;
      if (platform == null) return Left(config);

      final token = _firebaseMessagingService.fcmToken;
      if (config.fcmTokens[platform] == token) return Left(config);

      final uid = await _authRepository.requireUserId();
      await _notificationConfigRepository.upsertToken(
        uid: uid,
        platform: platform,
        token: token,
      );
      return Left(
        config.copyWith(
          fcmTokens: {
            ...config.fcmTokens,
            platform: token,
          },
        ),
      );
    } catch (_) {
      return Right(RegisterDeviceTokenFailure());
    }
  }
}
