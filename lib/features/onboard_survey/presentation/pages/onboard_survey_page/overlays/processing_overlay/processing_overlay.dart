import 'package:flutter/material.dart';

import '../../../../../../../core/resources/colors/app_colors.dart';
import '../../../../../../../core/resources/text/app_text_theme.dart';
import '../../widgets/translucent_card_container.dart';

class ProcessingOverlay extends StatelessWidget {
  const ProcessingOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = AppTextTheme.of(context);
    return Material(
      color: AppColors.black.value.withValues(alpha: 0.45),
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {},
        child: Center(
          child: TranslucentCardContainer(
            child: Text(
              'Processing...',
              style: textTheme.medium14.copyWith(
                color: AppColors.white.value,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
