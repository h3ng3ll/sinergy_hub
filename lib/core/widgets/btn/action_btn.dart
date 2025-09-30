import 'package:flutter/material.dart';

import '../../resources/colors/app_color_scheme.dart';
import '../../resources/text/app_text_theme.dart';

class ActionBtn extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;

  const ActionBtn({
    super.key,
    required this.onPressed,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColorScheme.of(context);
    final textTheme = AppTextTheme.of(context);
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: colorScheme.primary,
        shape: RoundedRectangleBorder(
          side: BorderSide(),
          borderRadius: BorderRadius.circular(
            8.0,
          ),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 10.0,
        ),
        child: child
      ),
    );
  }
}
