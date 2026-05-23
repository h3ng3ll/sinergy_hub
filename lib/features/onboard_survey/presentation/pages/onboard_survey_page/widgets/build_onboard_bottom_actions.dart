import 'package:flutter/material.dart';

import '../../../../../../core/resources/colors/app_color_scheme.dart';
import '../../../../../../core/resources/colors/app_colors.dart';
import '../../../../../../core/resources/text/app_text_theme.dart';
import '../../../../../../core/widgets/btn/action_btn.dart';
import '../../../../../../core/widgets/btn/custom_text_btn.dart';

class BuildOnboardBottomActions extends StatelessWidget {
  final VoidCallback skipForNow;
  final VoidCallback? onPressed;

  const BuildOnboardBottomActions({
    super.key,
    required this.skipForNow,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColorScheme.of(context);
    final textTheme = AppTextTheme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        // CustomTextBtn(
        //   text: 'Skip for now',
        //   onPressed: skipForNow,
        // ),
        ActionBtn(
          onPressed: onPressed,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Continue',
                style: textTheme.bold14.copyWith(
                  color: onPressed == null
                      ? colorScheme.secondary
                      : AppColors.black.value,
                ),
              ),
              Icon(
                Icons.arrow_forward,
                color: onPressed == null
                    ? colorScheme.secondary
                    : AppColors.black.value,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
