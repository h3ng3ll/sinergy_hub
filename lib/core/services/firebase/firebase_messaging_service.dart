import 'dart:async';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import '../../utils/env/env.dart';
import '../local_notification_service.dart';
import '../notification_tap_processor.dart';

@pragma('vm:entry-point')
Future<void> _firebaseBackgroundHandler(RemoteMessage message) async {
  // Нужно инициализировать сервис, если он есть в background
  final localService = LocalNotificationService(
    notificationTapProcessor: NotificationTapProcessor(),
  );
  final notification = message.notification;
  if (notification != null) {
    debugPrint('Background Message notification details: ');
    debugPrint('Title: ${message.notification?.title}');
    debugPrint('Body: ${message.notification?.body}');
    debugPrint('Data: ${message.data}');
    await localService.sendNotification(
      title: notification.title ?? 'New Notification',
      body: notification.body ?? '',
      payload: message.data,
    );
  }
}

class FirebaseMessagingService {
  final FirebaseMessaging _firebaseMessaging;

  final LocalNotificationService _localNotificationService;
  final Env _env;

  /// Nullable and set once [init] settles — read [fcmTokenReady] instead of
  /// this field directly, since [init] is deliberately never awaited at app
  /// startup (see main.dart) and a direct read can race it.
  String? fcmToken;

  final Completer<String?> _tokenReadyCompleter = Completer<String?>();

  static bool _isBackgroundHandlerInitialized = false;

  String? get platformKey {
    if (kIsWeb) return null;
    if (Platform.isAndroid) return 'android';
    if (Platform.isIOS) return 'ios';
    return null;
  }

  /// Resolves once the initial token fetch inside [init] has settled — with
  /// the token, or `null` if it could not be obtained (permission denied,
  /// simulator, transient error, ...). Callers that need the token (e.g.
  /// registering it with the backend) MUST await this instead of reading
  /// [fcmToken] directly: [init] runs unawaited from main.dart on purpose
  /// (awaiting it there would delay first frame, especially on web), so a
  /// direct field read can fire before the token exists.
  ///
  /// Guaranteed to complete even if [init] throws — see the `finally` block
  /// there — so this Future never hangs forever.
  Future<String?> get fcmTokenReady => _tokenReadyCompleter.future;

  /// Fires whenever FCM rotates the device token during the app's lifetime
  /// (not just at startup). Token rotation is rare but real; without
  /// re-registering on this event the backend keeps sending pushes to a
  /// dead token and the user silently stops receiving them.
  Stream<String> get onTokenRefresh => _firebaseMessaging.onTokenRefresh;

  FirebaseMessagingService({
    required this._localNotificationService,
    required this._firebaseMessaging,
    required this._env,
  });

  Future<void> init() async {
    try {
      // Запрос разрешений на iOS
      /// not blocking loading not await

      await _firebaseMessaging.requestPermission(
        alert: true,
        announcement: true,
        badge: true,
        carPlay: false,
        criticalAlert: false,
        provisional: false,
        sound: true,
      );

      /// Do not have APN token yet skip...
      // if (!kIsWeb && Platform.isIOS) return;
      if (!kIsWeb) {
        final token = await _firebaseMessaging.getToken();
        if (kDebugMode) {
          print('FCM device token: $token');
        }

        fcmToken = token;

        // Слушаем background сообщения - регистрируем только один раз
        if (!_isBackgroundHandlerInitialized) {
          FirebaseMessaging.onBackgroundMessage(
            _firebaseBackgroundHandler,
          );
          _isBackgroundHandlerInitialized = true;
        }
      } else {
        // Web тоже может получать токен!
        final token = await _firebaseMessaging.getToken(
          vapidKey: _env.webPushCertificate(),
        );

        if (kDebugMode) {
          print('FCM WEB token: $token');
        }

        fcmToken = token;
      }

      // Слушаем foreground сообщения
      FirebaseMessaging.onMessage.listen(_handleMessage);
    } finally {
      // Always completes — with the token on success, with whatever
      // [fcmToken] holds (possibly null) if something above threw — so
      // [fcmTokenReady] can never hang forever.
      if (!_tokenReadyCompleter.isCompleted) {
        _tokenReadyCompleter.complete(fcmToken);
      }
    }
  }

  void _handleMessage(RemoteMessage message) {
    final notification = message.notification;
    debugPrint('Has notification $notification');
    if (notification != null) {
      debugPrint('Message notification details: ');
      debugPrint('Title: ${message.notification?.title}');
      debugPrint('Body: ${message.notification?.body}');
      debugPrint('Data: ${message.data}');

      _localNotificationService.sendNotification(
        title: notification.title ?? 'New Notification',
        body: notification.body ?? '',
        payload: message.data,
      );
    }
  }
}
