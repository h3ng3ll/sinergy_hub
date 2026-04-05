import 'package:flutter/material.dart';

import '../../../../../../core/resources/colors/app_colors.dart';
import '../../../../../../core/resources/text/app_text_theme.dart';
import '../../../../../../core/utils/responsive_helper.dart';

class SkillTag extends StatelessWidget {
  final String skillName;
  final double fontSize;
  final double screenWidth;
  final AppTextTheme textTheme;

  const SkillTag({
    super.key,
    required this.skillName,
    required this.fontSize,
    required this.screenWidth,
    required this.textTheme,
  });

  @override
  Widget build(BuildContext context) {
    final skillColors = [
      AppColors.darkOrchid.value,
      AppColors.blueGray.value,
      AppColors.apple.value,
      AppColors.hotPink.value,
      AppColors.royalBlue.value,
    ];
    final colorIndex = skillName.hashCode % skillColors.length;
    final borderRadius = ResponsiveHelper.responsiveBorderRadius(
      screenWidth,
      20.0,
      maxRadius: 28,
    );
    final horizontalPadding = ResponsiveHelper.responsivePadding(
      screenWidth,
      14.0,
      maxPadding: 20,
    );
    final verticalPadding = ResponsiveHelper.responsivePadding(
      screenWidth,
      6.0,
      maxPadding: 10,
    );

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: verticalPadding,
      ),
      decoration: BoxDecoration(
        color: skillColors[colorIndex].withValues(alpha: 0.85),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Text(
        skillName,
        style: textTheme.medium12.copyWith(
          color: AppColors.white.value,
          fontSize: fontSize,
        ),
      ),
    );
  }
}
