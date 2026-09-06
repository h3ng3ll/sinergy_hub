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
  late String fcmToken;

  static bool _isBackgroundHandlerInitialized = false;

  String? get platformKey {
    if (kIsWeb) return null;
    if (Platform.isAndroid) return 'android';
    if (Platform.isIOS) return 'ios';
    return null;
  }

  FirebaseMessagingService({
    required LocalNotificationService localNotificationService,
    required FirebaseMessaging firebaseMessaging,
    required Env env,
  }) : _localNotificationService = localNotificationService,
       _env = env,
       _firebaseMessaging = firebaseMessaging;

  Future<void> init() async {
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
      String? token = await _firebaseMessaging.getToken();
      if (kDebugMode) {
        print('FCM device token: $token');
      }

      if (token != null) {
        fcmToken = token;
      }
      // Слушаем background сообщения - регистрируем только один раз
      if (!_isBackgroundHandlerInitialized) {
        FirebaseMessaging.onBackgroundMessage(
          _firebaseBackgroundHandler,
        );
        _isBackgroundHandlerInitialized = true;
      }
    } else {
      // Web тоже может получать токен!
      String? token = await _firebaseMessaging.getToken(
        vapidKey: _env.webPushCertificate(),
      );

      if (kDebugMode) {
        print('FCM WEB token: $token');
      }

      if (token != null) {
        fcmToken = token;
      }
    }

    // Сохрани его в backend (для отправки пушей)

    // Слушаем foreground сообщения
    FirebaseMessaging.onMessage.listen(_handleMessage);
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
