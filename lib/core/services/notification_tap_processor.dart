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
      premium: (_) {},
      unknown: (_) {},
      chat: (chatData) {
        ChatPageRoute(
          chatId: chatData.chatId,
        ).go(
          context,
        );
      },
    );
  }
}
