import 'package:flutter/material.dart' hide Notification;

import '../../../../../../../core/resources/colors/app_colors.dart';
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
      padding: EdgeInsets.all(
        16.0,
      ),
      decoration: BoxDecoration(
        color: AppColors.whiteLilac.value,
        borderRadius: BorderRadius.circular(
          25.0,
        ),

      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                notification.title,
                  style: textTheme.medium14,
              ),
              Text(
                notification.description,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
