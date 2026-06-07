import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../../core/resources/colors/app_colors.dart';
import '../../../../../../core/resources/text/app_text_theme.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = AppTextTheme.of(context);
    final lineColor = AppColors.white.value.withValues(
      alpha: 0.3,
    );

    return Row(
      children: [
        Expanded(
          child: Divider(
            color: lineColor,
            thickness: 0.5,
          ),
        ),
        Gap(12.0),
        Text(
          'OR',
          style: textTheme.medium14.copyWith(
            color: AppColors.white.value,
          ),
        ),
        Gap(12.0),
        Expanded(
          child: Divider(
            color: lineColor,
            thickness: 0.5,
          ),
        ),
      ],
    );
  }
}
