import 'package:flutter/material.dart';

import '../../../../../../core/resources/colors/app_colors.dart';
import '../../../../../../core/resources/text/app_text_theme.dart';
import '../../../../../../core/utils/responsive_helper.dart';

class OnlineBadge extends StatelessWidget {
  final bool isOnline;
  final double screenWidth;
  final AppTextTheme textTheme;

  const OnlineBadge({
    super.key,
    required this.isOnline,
    required this.screenWidth,
    required this.textTheme,
  });

  @override
  Widget build(BuildContext context) {
    final badgeFontSize = ResponsiveHelper.responsiveFontSize(
      screenWidth,
      12.0,
      maxFontSize: 16,
    );
    final badgePadding = ResponsiveHelper.responsivePadding(
      screenWidth,
      8.0,
      maxPadding: 14,
    );
    final badgeRadius = ResponsiveHelper.responsiveBorderRadius(
      screenWidth,
      20.0,
      maxRadius: 28,
    );
    final dotSize = ResponsiveHelper.responsiveSpacing(
      screenWidth,
      8.0,
      maxSpacing: 12,
    );

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: badgePadding,
            vertical: badgePadding * 0.5,
          ),
          decoration: BoxDecoration(
            color: isOnline
                ? AppColors.greenCrayola.value
                : AppColors.heartRed.value,
            borderRadius: BorderRadius.circular(badgeRadius),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            spacing: ResponsiveHelper.responsiveSpacing(screenWidth, 6.0),
            children: [
              Container(
                width: dotSize,
                height: dotSize,
                decoration: BoxDecoration(
                  color: AppColors.white.value,
                  shape: BoxShape.circle,
                ),
              ),
              Text(
                isOnline ? 'Online' : 'Offline',
                style: textTheme.medium12.copyWith(
                  color: AppColors.white.value,
                  fontSize: badgeFontSize,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
