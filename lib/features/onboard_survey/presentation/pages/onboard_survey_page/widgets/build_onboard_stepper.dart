import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import '../../../../../../core/resources/colors/app_color_scheme.dart';
import '../../../../../../core/resources/colors/app_colors.dart';
import '../../../../../../core/resources/text/app_text_theme.dart';

class BuildOnboardStepper extends StatelessWidget {
  final int step;

  const BuildOnboardStepper({
    super.key,
    required this.step,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColorScheme.of(context);
    final textTheme = AppTextTheme.of(context);

    return Row(
      children: [
        Spacer(),
        Expanded(
          flex: 6,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Step $step of 4',
                    style: textTheme.regular12.copyWith(
                      color: colorScheme.secondary,
                    ),
                  ),
                  Text(
                    '${step * 25}%',
                    style: textTheme.regular14.copyWith(
                      color: colorScheme.secondary,
                    ),
                  ),
                ],
              ),
              Gap(10.0),
              StepProgressIndicator(
                totalSteps: 4,
                size: 10,
                currentStep: step,
                selectedGradientColor: LinearGradient(
                  colors: [
                    AppColors.buttonBlue.value,
                    AppColors.darkOrchid.value,
                  ],
                ),
                roundedEdges: Radius.circular(
                  12.5,
                ),

                unselectedColor: AppColors.white.value.withValues(
                  alpha: 0.3,
                ),
              ),
            ],
          ),
        ),
        Spacer(),
      ],
    );
  }
}
