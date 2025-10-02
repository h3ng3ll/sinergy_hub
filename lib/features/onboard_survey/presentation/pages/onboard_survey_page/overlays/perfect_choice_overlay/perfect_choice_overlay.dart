import 'package:flutter/material.dart';

import '../../../../../../../core/resources/colors/app_color_scheme.dart';
import '../../../../../../../core/resources/text/app_text_theme.dart';
import '../../widgets/survey_card/build_selected_check.dart';

class PerfectChoiceOverlay extends StatelessWidget {
  const PerfectChoiceOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColorScheme.of(context);
    final textTheme = AppTextTheme.of(context);

    return Center(
      child: Material(
        color: Colors.transparent,
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
                    color: colorScheme.onPrimary,
                  ),
                ),
                Text(
                  'moving to the next step!',
                  style: textTheme.medium20.copyWith(
                    color: colorScheme.secondary,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
