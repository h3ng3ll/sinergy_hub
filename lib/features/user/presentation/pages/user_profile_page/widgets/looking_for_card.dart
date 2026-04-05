import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../core/resources/colors/app_colors.dart';
import '../../../../../../core/resources/text/app_text_theme.dart';
import '../../../../../../core/utils/responsive_helper.dart';
import '../../../../../onboard_survey/domain/models/specialization/specialization.dart';
import '../../../../../onboard_survey/domain/models/specializations/specializations.dart';

class LookingForCard extends StatelessWidget {
  final int index;
  final ESpecialization specialization;
  final double screenWidth;
  final double pagePadding;
  final AppTextTheme textTheme;

  const LookingForCard({
    super.key,
    required this.index,
    required this.specialization,
    required this.screenWidth,
    required this.pagePadding,
    required this.textTheme,
  });

  @override
  Widget build(BuildContext context) {
    final Specialization spec = Specializations.get(
      specialization,
    );
    final color = spec.colors.first;
    final cardBorderRadius = ResponsiveHelper.responsiveBorderRadius(
      screenWidth,
      12.0,
      maxRadius: 18,
    );
    final cardPadding = ResponsiveHelper.responsivePadding(
      screenWidth,
      16.0,
      maxPadding: 24,
    );
    final iconSize = ResponsiveHelper.responsiveIconSize(
      screenWidth,
      28.0,
      maxSize: 40,
    );
    final cardTextFontSize = ResponsiveHelper.responsiveFontSize(
      screenWidth,
      15.0,
      maxFontSize: 20,
    );

    return SizedBox(
      height: 115.0,
      width:
          (screenWidth -
              pagePadding * 2 -
              ResponsiveHelper.responsiveSpacing(screenWidth, 12.0)) /
          2,
      child: Container(
        padding: EdgeInsets.all(cardPadding),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(cardBorderRadius),
          border: Border.all(
            color: color.withValues(alpha: 0.3),
            width: 1.0,
          ),
        ),
        child: Column(
          spacing: ResponsiveHelper.responsiveSpacing(screenWidth, 10.0),
          children: [
            SvgPicture.asset(
              spec.icon,
              width: iconSize,
              height: iconSize,
              colorFilter: ColorFilter.mode(
                color,
                BlendMode.srcIn,
              ),
            ),
            Text(
              spec.name,
              style: textTheme.semiBold15.copyWith(
                color: color,
                fontSize: cardTextFontSize,
              ),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
