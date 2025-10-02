import 'package:flutter/material.dart';

import '../../../../../../../core/resources/colors/app_color_scheme.dart';
import '../../../../../../../core/resources/text/app_text_theme.dart';
import '../../widgets/translucent_card_container.dart';

class ProcessingOverlay extends StatelessWidget {
  const ProcessingOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColorScheme.of(context);
    final textTheme = AppTextTheme.of(context);
    return Center(
      child: TranslucentCardContainer(
        child: Material(
          color: Colors.transparent,
          child: Text(
            'Processing...',
            style: textTheme.medium14.copyWith(
              color: colorScheme.onPrimary,
            ),
          ),
        ),
      ),
    );
  }
}
