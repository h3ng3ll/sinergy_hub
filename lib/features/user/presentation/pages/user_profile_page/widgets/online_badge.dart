import 'package:flutter/material.dart';

import '../../../../../../core/resources/translations/app_localizations.dart';
import '../../../../../../core/resources/colors/app_colors.dart';
import '../../../../../../core/resources/text/app_text_theme.dart';

class OnlineBadge extends StatelessWidget {
  final bool isOnline;

  const OnlineBadge({
    super.key,
    required this.isOnline,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = AppTextTheme.of(context);
    final statusColor = isOnline
        ? AppColors.greenCrayola.value
        : AppColors.heartRed.value;

    return Row(
      mainAxisSize: MainAxisSize.min,
      spacing: 6.0,
      children: [
        DecoratedBox(
          decoration: BoxDecoration(
            color: statusColor,
            shape: BoxShape.circle,
          ),
          child: const SizedBox.square(
            dimension: 8.0,
          ),
        ),
        Text(
          isOnline ? AppLocalizations.of(context)!.status_online : AppLocalizations.of(context)!.status_offline,
          style: textTheme.medium14.copyWith(
            color: AppColors.white.value.withValues(alpha: 0.92),
          ),
        ),
      ],
    );
  }
}
