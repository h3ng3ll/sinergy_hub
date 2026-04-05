import 'package:flutter/material.dart';

import '../../../../../../core/resources/colors/app_color_scheme.dart';
import '../../../../../../core/resources/text/app_text_theme.dart';
import '../../../../../../core/utils/responsive_helper.dart';
import '../../../../domain/models/user_data/user_data.dart';

class AboutSection extends StatelessWidget {
  final UserData userData;
  final double screenWidth;
  final AppColorScheme colorScheme;
  final AppTextTheme textTheme;

  const AboutSection({
    super.key,
    required this.userData,
    required this.screenWidth,
    required this.colorScheme,
    required this.textTheme,
  });

  @override
  Widget build(BuildContext context) {
    final titleFontSize = ResponsiveHelper.responsiveFontSize(
      screenWidth,
      20.0,
      maxFontSize: 28,
    );
    final contentFontSize = ResponsiveHelper.responsiveFontSize(
      screenWidth,
      15.0,
      maxFontSize: 18,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: ResponsiveHelper.responsiveSpacing(screenWidth, 10.0),
      children: [
        Text(
          'About',
          style: textTheme.bold20.copyWith(
            color: colorScheme.onSurface,
            fontSize: titleFontSize,
          ),
        ),
        Text(
          userData.aboutMe!,
          style: textTheme.regular14.copyWith(
            color: colorScheme.onSurface.withValues(alpha: 0.8),
            fontSize: contentFontSize,
          ),
        ),
      ],
    );
  }
}
