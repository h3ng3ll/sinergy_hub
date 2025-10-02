import 'package:flutter/material.dart';

import '../../resources/colors/app_color_scheme.dart';
import '../../resources/text/app_text_theme.dart';

class CustomTextBtn extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomTextBtn({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColorScheme.of(context);
    final textTheme = AppTextTheme.of(context);
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: textTheme.medium14.copyWith(
          color: colorScheme.secondary,
        ),
      ),
    );
  }
}
