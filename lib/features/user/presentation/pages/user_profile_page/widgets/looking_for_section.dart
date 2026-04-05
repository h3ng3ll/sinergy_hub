import 'package:flutter/material.dart';

import '../../../../../../core/resources/colors/app_color_scheme.dart';
import '../../../../../../core/resources/text/app_text_theme.dart';
import '../../../../../../core/utils/responsive_helper.dart';
import '../../../../domain/models/user_data/user_data.dart';
import 'looking_for_card.dart';

class LookingForSection extends StatelessWidget {
  final UserData userData;
  final double screenWidth;
  final double pagePadding;
  final AppColorScheme colorScheme;
  final AppTextTheme textTheme;

  const LookingForSection({
    super.key,
    required this.userData,
    required this.screenWidth,
    required this.pagePadding,
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

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: ResponsiveHelper.responsiveSpacing(screenWidth, 16.0),
      children: [
        Text(
          'Looking For',
          style: textTheme.bold20.copyWith(
            color: colorScheme.onSurface,
            fontSize: titleFontSize,
          ),
        ),
        GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing:   ResponsiveHelper.responsiveSpacing(screenWidth, 12.0),
            mainAxisSpacing: ResponsiveHelper.responsiveSpacing(screenWidth, 12.0),
          ),
          itemCount: userData.profiler.searchingSpecializations.length,
          shrinkWrap: true,
          itemBuilder: (context , index) {
            final entry = userData.profiler.searchingSpecializations[index];
            return LookingForCard(
              index: index,
              specialization: entry,
              screenWidth: screenWidth,
              pagePadding: pagePadding,
              textTheme: textTheme,
            );
          },
        ),
      ],
    );
  }
}
