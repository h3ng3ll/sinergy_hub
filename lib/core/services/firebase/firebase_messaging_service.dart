import 'package:firebase_messaging/firebase_messaging.dart';
import '../../di/injection.dart';
import '../local_notification_service.dart';

class FirebaseMessagingService {
  final FirebaseMessaging _firebaseMessaging ;
  final LocalNotificationService _localNotificationService;

  late String fcmToken ;
  FirebaseMessagingService({
    required LocalNotificationService localNotificationService,
    required FirebaseMessaging firebaseMessaging,
  }) : _localNotificationService = localNotificationService,
       _firebaseMessaging = firebaseMessaging;

  Future<void> init() async {
    // Запрос разрешений на iOS
    await _firebaseMessaging.requestPermission();

    // Получаем токен устройства
    String? token = await _firebaseMessaging.getToken();
    print(
      'FCM device token: $token',
    );
    if(token != null) {
      fcmToken = token;
    }

    // Сохрани его в backend (для отправки пушей)

    // Слушаем foreground сообщения
    FirebaseMessaging.onMessage.listen(_handleMessage);

    // Слушаем background сообщения
    FirebaseMessaging.onBackgroundMessage(_firebaseBackgroundHandler);
  }

  void _handleMessage(RemoteMessage message) {
    final notification = message.notification;
    if (notification != null) {
      _localNotificationService.sendNotification(
        title: notification.title ?? 'New Notification',
        body: notification.body ?? '',
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
      );
    }
  }
}
