
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../../di/injection.dart';
import '../local_notification_service.dart';

class FirebaseMessagingService {
  final FirebaseMessaging _firebaseMessaging;

  final LocalNotificationService _localNotificationService;

  late String fcmToken;

  static bool _isBackgroundHandlerInitialized = false;


  FirebaseMessagingService({
    required LocalNotificationService localNotificationService,
    required FirebaseMessaging firebaseMessaging,
  }) : _localNotificationService = localNotificationService,
       _firebaseMessaging = firebaseMessaging;

  Future<void> init() async {
    // Запрос разрешений на iOS
    /// not blocking loading not await
    _firebaseMessaging.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

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
        FirebaseMessaging.onBackgroundMessage(_firebaseBackgroundHandler);
        _isBackgroundHandlerInitialized = true;
      }
    } else {
      // Web тоже может получать токен!
      String? token = await _firebaseMessaging.getToken(
        vapidKey: dotenv.env['FIREBASE_WEB_PUSH_CERTIFICATE'],
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

  static Future<void> _firebaseBackgroundHandler(RemoteMessage message) async {
    // Нужно инициализировать сервис, если он есть в background
    final localService = getIt<LocalNotificationService>();
    final notification = message.notification;
    if (notification != null) {
      await localService.sendNotification(
        title: notification.title ?? 'New Notification',
        body: notification.body ?? '',
        payload: message.data,
      );
    }
  }
}
