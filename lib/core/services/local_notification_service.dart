import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:go_router/go_router.dart';
import 'package:path_provider/path_provider.dart';

import '../../features/notifications/domain/models/notification_data/notification_data.dart';
import '../../features/notifications/presentation/widgets/web_notification_widget.dart';
import '../routes/init_router/init_router.dart';
import 'notification_tap_processor.dart';

@pragma('vm:entry-point')
void notificationTopBackground(NotificationResponse notificationResponse) {
  LocalNotificationService(
    notificationTapProcessor: NotificationTapProcessor(),
  ).receiveNotificationResponse(
    notificationResponse,
  );
}

class LocalNotificationService {
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  final NotificationTapProcessor _notificationTapProcessor;

  LocalNotificationService({
    required NotificationTapProcessor notificationTapProcessor,
  }) : _notificationTapProcessor = notificationTapProcessor;

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
    final notificationData = NotificationData.fromJson(
      jsonDecode(
        payload,
      ),
    );
    await _notificationTapProcessor.processTap(
      notificationData,
      context,
    );
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
      final notificationData = NotificationData.fromJson(
        payload,
      );
      switch (notificationData) {
        case ChatNotificationData(chatId: final chatId):
          final isOnCurrentChat =
              GoRouter.of(context).state.uri.toString() ==
              ChatPageRoute(chatId: chatId).location;

          if (isOnCurrentChat) return;

        case MatchNotificationData():
          break;
      }
    }

    if (kIsWeb) {
      await _showWebNotification(
        title: title,
        body: body,
        payload: payload,
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

  Future<void> _showWebNotification({
    required String title,
    required String body,
    dynamic payload,
  }) async {
    final rootContext = RootPageRoute.rootKey.currentContext;
    if (rootContext == null) return;

    final notificationData = payload != null
        ? NotificationData.fromJson(payload)
        : null;

    final imageUrl = switch (notificationData) {
      ChatNotificationData(senderAvatar: final avatar) => avatar,
      MatchNotificationData() => null,
      null => null,
    };

    OverlayEntry? overlayEntry;

    void dismissNotification() {
      overlayEntry?.remove();
      overlayEntry?.dispose();
      overlayEntry = null;
    }

    overlayEntry = OverlayEntry(
      builder: (_) => Positioned(
        top: 16,
        right: 16,
        child: WebNotificationWidget(
          title: title,
          body: body,
          imageUrl: imageUrl,
          onTap: () {
            dismissNotification();
            if (notificationData != null) {
              _notificationTapProcessor.processTap(
                notificationData,
                rootContext,
              );
            }
          },
          onDismiss: dismissNotification,
        ),
      ),
    );

    final entry = overlayEntry;
    if (entry != null) {
      Overlay.of(rootContext).insert(entry);
    }
  }
}
