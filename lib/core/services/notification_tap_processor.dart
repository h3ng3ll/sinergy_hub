import 'package:flutter/material.dart';

import '../../../features/notifications/domain/models/notification_data/notification_data.dart';
import '../../../core/routes/init_router/init_router.dart';

class NotificationTapProcessor {
  Future<void> processTap(
    NotificationData data,
    BuildContext context,
  ) async {
    data.map(
      match: (_) {},
      chat: (chatData) {
        ChatPageRoute(
          chatId: chatData.chatId,
        ).push(
          context,
        );
      },
    );
  }
}
