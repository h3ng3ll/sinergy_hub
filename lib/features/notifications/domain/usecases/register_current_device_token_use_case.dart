import 'package:dartz/dartz.dart';

import '../../../../core/services/firebase/firebase_messaging_service.dart';
import '../../../../core/services/logger_service.dart';
import '../../../auth/domain/repostories/i_auth_repository.dart';
import '../failures/notification_config_failures.dart';
import '../failures/register_device_token_failure.dart';
import '../models/notification_config/notification_config.dart';
import '../repositories/i_notification_config_repository.dart';

/// How long to wait for [FirebaseMessagingService.fcmTokenReady] before
/// giving up on this registration attempt. [FirebaseMessagingService.init]
/// runs unawaited from main.dart, so on a very slow device/network this
/// bounds how long a caller can be left waiting rather than hanging forever
/// (the Future itself is already guaranteed to complete — see
/// [FirebaseMessagingService.fcmTokenReady] — this is a second, independent
/// safety net).
const Duration _kTokenReadyTimeout = Duration(seconds: 15);

const String _kLogName = 'FcmRegister';

class RegisterCurrentDeviceTokenUseCase {
  final INotificationConfigRepository _notificationConfigRepository;
  final IAuthRepository _authRepository;
  final FirebaseMessagingService _firebaseMessagingService;
  final LoggerService _logger;

  RegisterCurrentDeviceTokenUseCase({
    required INotificationConfigRepository notificationConfigRepository,
    required IAuthRepository authRepository,
    required FirebaseMessagingService firebaseMessagingService,
    required LoggerService logger,
  }) : _notificationConfigRepository = notificationConfigRepository,
       _authRepository = authRepository,
       _firebaseMessagingService = firebaseMessagingService,
       _logger = logger;

  /// [tokenOverride] is passed when this is called in response to
  /// [FirebaseMessagingService.onTokenRefresh] — that stream already hands
  /// over the new token directly, so there is nothing to await there. When
  /// omitted (the first-registration path, right after sign-in), the token
  /// is awaited via [FirebaseMessagingService.fcmTokenReady] instead of
  /// read directly, so this never races the app's unawaited notification
  /// init.
  Future<Either<NotificationConfig, NotificationConfigFailure>> call({
    required NotificationConfig config,
    String? tokenOverride,
  }) async {
    try {
      final platform = _firebaseMessagingService.platformKey;
      if (platform == null) {
        _logger.debug('skip: no-platform', name: _kLogName);
        return Left(config);
      }

      final token =
          tokenOverride ??
          await _firebaseMessagingService.fcmTokenReady.timeout(
            _kTokenReadyTimeout,
            onTimeout: () => null,
          );
      if (token == null) {
        _logger.warning('skip: no-token ($platform)', name: _kLogName);
        return Left(config);
      }
      if (config.fcmTokens[platform] == token) {
        _logger.debug(
          'skip: already-registered ($platform, ${_short(token)})',
          name: _kLogName,
        );
        return Left(config);
      }

      final uid = await _authRepository.requireUserId();
      await _notificationConfigRepository.upsertToken(
        uid: uid,
        platform: platform,
        token: token,
      );
      _logger.info(
        'written: users/$uid/notificationConfig/config '
        'fcmTokens.$platform=${_short(token)} '
        '(stored was ${_short(config.fcmTokens[platform])})',
        name: _kLogName,
      );
      return Left(
        config.copyWith(
          fcmTokens: {
            ...config.fcmTokens,
            platform: token,
          },
        ),
      );
    } catch (e, st) {
      _logger.error(
        'failed to register device token',
        error: e,
        stackTrace: st,
        name: _kLogName,
      );
      return Right(RegisterDeviceTokenFailure());
    }
  }

  String _short(String? token) =>
      token == null ? 'null' : '${token.substring(0, token.length.clamp(0, 12))}…';
}
