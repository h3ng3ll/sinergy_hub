import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../../core/resources/colors/app_color_scheme.dart';
import '../../../../../../core/resources/text/app_text_theme.dart';

class OnboardSurveyHeader extends StatelessWidget {
  final String title;

  final String description;

  const OnboardSurveyHeader({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColorScheme.of(context);
    final textTheme = AppTextTheme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,

      children: [
        Text(
          title,
          style: textTheme.bold24.copyWith(
            color: colorScheme.onPrimary,
          ),
          textAlign: TextAlign.center,
        ),
        Gap(15.0),

        Text(
          description,
          style: textTheme.regular14.copyWith(
            color: colorScheme.secondary,
          ),
        ),
      ],
    );
  }
}
