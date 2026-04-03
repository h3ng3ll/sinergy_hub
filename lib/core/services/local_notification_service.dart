import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:go_router/go_router.dart';
import 'package:path_provider/path_provider.dart';

import '../di/injection.dart';
import '../models/chat_payload/chat_payload.dart';
import '../routes/init_router/init_router.dart';

@pragma('vm:entry-point')
void notificationTopBackground(NotificationResponse notificationResponse) {
  getIt<LocalNotificationService>().receiveNotificationResponse(
    notificationResponse,
  );
}

class LocalNotificationService {
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> init() async {
    await _checkPermissions();

    final AndroidInitializationSettings androidInitializationSettings =
        AndroidInitializationSettings(
          '@mipmap/ic_launcher',
        );
    final DarwinInitializationSettings darwinInitializationSettings =
        DarwinInitializationSettings();

    final InitializationSettings initializationSettings =
        InitializationSettings(
          android: androidInitializationSettings,
          iOS: darwinInitializationSettings,
        );

    await _flutterLocalNotificationsPlugin.initialize(
      settings: initializationSettings,
      onDidReceiveNotificationResponse: receiveNotificationResponse,
      onDidReceiveBackgroundNotificationResponse: notificationTopBackground,
    );
    _registerNotifications();
  }

  Future<void> _checkPermissions() async {
    if (kIsWeb) return;
    if (Platform.isAndroid) {
      final androidImpl = _flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin
          >();

      await androidImpl?.requestFullScreenIntentPermission();
      await androidImpl?.requestNotificationsPermission();
    } else if (Platform.isIOS) {
      final iosImpl = _flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin
          >();

      await iosImpl?.requestPermissions(
        alert: true,
        badge: true,
        sound: true,
      );
    }
  }

  void _registerNotifications() {
    AndroidNotificationDetails(
      'game-notification',
      'game-notification',
      actions: [],
    );
  }

  Future<String> copyAssetToTemp(String assetPath, String filename) async {
    final byteData = await rootBundle.load(assetPath);

    final tempDir = await getTemporaryDirectory();
    final file = File('${tempDir.path}/$filename');

    await file.writeAsBytes(byteData.buffer.asUint8List());

    return file.path;
  }

  Future<void> receiveNotificationResponse(
    NotificationResponse notificationResponse,
  ) async {
    final payload = notificationResponse.payload;
    if (payload == null) return;

    final context = RootPageRoute.rootKey.currentContext;
    if (context == null || !context.mounted) {
      return;
    }
    final payloadData = jsonDecode(
      payload,
    );

    if (payloadData['type'] == 'chat') {
      final chat = ChatPayload.fromJson(
        payloadData,
      );
      ChatPageRoute(
        chatId: chat.chatId,
      ).push(
        context,
      );
    }
  }

  Future<void> sendNotification({
    required String title,
    required String body,
    String? icon,
    dynamic payload,

    /// Map<String , dynamic> by default
  }) async {
    final payloadData = payload != null
        ? jsonEncode(
            payload,
          )
        : null;

    final context = RootPageRoute.rootKey.currentContext;

    if (context != null && context.mounted) {
      if (payload['type'] == 'chat') {
        final chat = ChatPayload.fromJson(
          payload,
        );
        final isOnCurrentChat =
            GoRouter.of(context).state.uri.toString() ==
            ChatPageRoute(
              chatId: chat.chatId,
            ).location;
        if (isOnCurrentChat) return;
      }
    }

    if (kIsWeb) {
      final androidNotificationDetails = AndroidNotificationDetails(
        'game-notification',
        'game-notification',
        actions: [],
        priority: Priority.high,
      );

      final darwinNotificationDetails = DarwinNotificationDetails(
        attachments: [],
      );
      await _flutterLocalNotificationsPlugin.show(
        id: 2,
        title: title,
        body: body,
        notificationDetails: NotificationDetails(
          android: androidNotificationDetails,
          iOS: darwinNotificationDetails,
          // no iOS attachments, no File
        ),
      );
    } else {
      String? largeIconPath =
          icon ??
          await copyAssetToTemp(
            'assets/images/ic_notification.png',
            'ic_notification.png',
          );

      final androidNotificationDetails = AndroidNotificationDetails(
        'game-notification',
        'game-notification',
        actions: [],
        priority: Priority.high,
        largeIcon: FilePathAndroidBitmap(
          largeIconPath,
        ),
      );

      final darwinNotificationDetails = DarwinNotificationDetails(
        attachments: [
          DarwinNotificationAttachment(
            largeIconPath,
          ),
        ],
      );

      await _flutterLocalNotificationsPlugin.show(
        id: 0,
        title: title,
        body: body,
        notificationDetails: NotificationDetails(
          android: androidNotificationDetails,
          iOS: darwinNotificationDetails,
        ),
        payload: payloadData,
      );
    }
  }
}
