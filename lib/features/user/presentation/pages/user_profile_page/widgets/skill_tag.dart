import 'package:flutter/material.dart';

import '../../../../../../core/resources/colors/app_colors.dart';
import '../../../../../../core/resources/text/app_text_theme.dart';

class SkillTag extends StatelessWidget {
  final String skillName;

  const SkillTag({
    super.key,
    required this.skillName,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = AppTextTheme.of(context);

    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        color: AppColors.white.value.withValues(alpha: 0.2),
        border: Border.all(
          width: 0.5,
          color: AppColors.white.value.withValues(alpha: 0.3),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 12.0,
          vertical: 7.0,
        ),
        child: Text(
          skillName,
          style: textTheme.medium12.copyWith(
            color: AppColors.white.value,
          ),
        ),
      ),
    );
  }
}
