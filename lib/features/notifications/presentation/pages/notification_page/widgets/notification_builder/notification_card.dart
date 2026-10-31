import 'package:flutter/material.dart' hide Notification;

import '../../../../../../../core/resources/colors/app_colors.dart';
import '../../../../../../../core/resources/text/app_text_theme.dart';
import '../../../../../../../core/resources/translations/app_localizations.dart';
import '../../../../../../../core/utils/extensions/date_time_ext.dart';
import '../../../../../../../core/widgets/wide/hover_card.dart';
import '../../../../../domain/models/notification/notification.dart';

/// Tablet/desktop notification row: tinted bell, title, description,
/// relative time and an unread dot.
class NotificationCard extends StatelessWidget {
  final Notification notification;

  const NotificationCard({
    super.key,
    required this.notification,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = AppTextTheme.of(context);
    final lo = AppLocalizations.of(context)!;
    final accent = AppColors.majorelleBlue.value;
    final ink = AppColors.jacarta.value;
    final muted = AppColors.darkBlueGray.value;
    final isUnread = !notification.hasRead;

    return HoverCard(
      padding: const EdgeInsets.symmetric(
        horizontal: 18.0,
        vertical: 16.0,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 14.0,
        children: [
          Container(
            width: 42.0,
            height: 42.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: accent.withValues(
                alpha: 0.10,
              ),
            ),
            child: Icon(
              Icons.notifications_none_rounded,
              size: 22.0,
              color: accent,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 4.0,
              children: [
                Text(
                  notification.title,
                  style: (isUnread ? textTheme.bold16 : textTheme.medium16)
                      .copyWith(
                        color: ink,
                      ),
                ),
                Text(
                  notification.description,
                  style: textTheme.regular14.copyWith(
                    color: muted,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            spacing: 8.0,
            children: [
              Text(
                notification.createdAt.toRelativeLabel(lo),
                style: textTheme.regular12.copyWith(
                  color: muted,
                ),
              ),
              if (isUnread)
                Container(
                  width: 8.0,
                  height: 8.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: accent,
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
