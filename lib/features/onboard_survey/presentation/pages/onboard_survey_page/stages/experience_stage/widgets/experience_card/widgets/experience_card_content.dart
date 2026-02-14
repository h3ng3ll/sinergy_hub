import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../../../../../../../../../../core/resources/colors/app_color_scheme.dart';
import '../../../../../../../../../../core/resources/text/app_text_theme.dart';
import '../../../../../../../../domain/models/experience/experience.dart';

class ExperienceCardContent extends StatelessWidget {
  final String icon;
  final EExperience experience;
  final String name;
  final String yearExperience;
  final String description;

  const ExperienceCardContent({
    super.key,
    required this.icon,
    required this.experience,
    required this.name,
    required this.yearExperience,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColorScheme.of(context);
    final textTheme = AppTextTheme.of(context);
    return Column(
      children: [
        SvgPicture.asset(
          icon,
          width: 40,
          height: 70,
        ),
        Gap(15.0),
        Text(
          name,
          style: textTheme.medium16.copyWith(
            color: colorScheme.surface,
          ),
        ),
        Gap(15.0),
        AutoSizeText(
          yearExperience,
          style: textTheme.medium12.copyWith(
            color: colorScheme.surface.withValues(
              alpha: 0.8,
            ),
          ),
          maxLines: 1,
          minFontSize: 10,
        ),
        Gap(20.0),
        Text(
          description,
          style: textTheme.regular10.copyWith(
            color: colorScheme.surface.withValues(
              alpha: 0.8,
            ),
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
