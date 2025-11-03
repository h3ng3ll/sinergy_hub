import 'package:flutter/material.dart';

import '../../../../../../../../core/resources/colors/app_color_scheme.dart';
import '../../../../../../../../core/resources/text/app_text_theme.dart';

class BuildGroupedInput extends StatelessWidget {
  final String title;
  final Widget child;

  const BuildGroupedInput({
    super.key,
    required this.title,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColorScheme.of(context);
    final textTheme = AppTextTheme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 10.0,
      children: [
        Text(
          title,
          style: textTheme.regular14.copyWith(
            color: colorScheme.onPrimary,
          ),
        ),
        child,
      ],
    );
  }
}
