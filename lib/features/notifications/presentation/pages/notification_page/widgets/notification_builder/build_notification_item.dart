import 'package:flutter/material.dart' hide Notification;

import '../../../../../../../core/resources/text/app_text_theme.dart';
import '../../../../../domain/models/notification/notification.dart';

class BuildNotificationItem extends StatelessWidget {
  final Notification notification;
  final VoidCallback onTap;

  const BuildNotificationItem({
    super.key,
    required this.notification,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = AppTextTheme.of(context);
    
    return Container(
      child: Row(
        children: [
          // BuildUserAvatar(url: url)
        ],
      ),
    );
  }
}
