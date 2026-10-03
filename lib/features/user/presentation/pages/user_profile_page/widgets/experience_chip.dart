import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../core/resources/colors/app_colors.dart';
import '../../../../../../core/resources/text/app_text_theme.dart';
import '../../../../../onboard_survey/domain/models/experience/experience.dart';
import '../../../../../onboard_survey/domain/models/experiences/experiences.dart';

class ExperienceChip extends StatelessWidget {
  final EExperience experience;

  const ExperienceChip({
    super.key,
    required this.experience,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = AppTextTheme.of(context);
    final info = Experiences.get(experience);

    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22.0),
        color: AppColors.white.value.withValues(alpha: 0.18),
        border: Border.all(
          width: 0.5,
          color: AppColors.white.value.withValues(alpha: 0.3),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 9.0,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          spacing: 8.0,
          children: [
            SvgPicture.asset(
              info.icon,
              width: 18.0,
              height: 18.0,
            ),
            Text(
              info.name,
              style: textTheme.bold15.copyWith(
                color: AppColors.white.value,
              ),
            ),
            Flexible(
              child: Text(
                info.rangeExperience,
                overflow: TextOverflow.ellipsis,
                style: textTheme.regular14.copyWith(
                  color: AppColors.white.value.withValues(alpha: 0.85),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
