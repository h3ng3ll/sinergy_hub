import 'package:flutter/material.dart';

import '../../../../../../../core/resources/colors/app_colors.dart';
import '../../../../../../../core/resources/text/app_text_theme.dart';
import '../../widgets/survey_card/build_selected_check.dart';

class PerfectChoiceOverlay extends StatelessWidget {
  const PerfectChoiceOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = AppTextTheme.of(context);

    return Material(
      color: AppColors.black.value.withValues(alpha: 0.45),
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {},
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              BuildSelectedCheck(
                width: 150.0,
                height: 150.0,
                checkSize: 50,
              ),
              Column(
                children: [
                  Text(
                    'Perfect choice!',
                    style: textTheme.bold32.copyWith(
                      color: AppColors.white.value,
                    ),
                  ),
                  Text(
                    'moving to the next step!',
                    style: textTheme.medium20.copyWith(
                      color: AppColors.white.value.withValues(alpha: 0.85),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
