import 'package:flutter/material.dart';

import '../../resources/colors/app_color_scheme.dart';
import '../../resources/colors/app_colors.dart';

class ActionBtn extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget child;
  final EdgeInsets? padding;

  const ActionBtn({
    super.key,
    required this.onPressed,
    required this.child,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColorScheme.of(context);
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.resolveWith<Color>(
          (states) {
            if (states.contains(WidgetState.disabled)) {
              return AppColors.white.value.withValues(
                alpha: 0.1,
              ); // выключенная
            }
            // if (states.contains(WidgetState.pressed)) {
            //   return AppColors.royalBlue.value; // при нажатии
            // }
            return AppColors.white.value.withValues(
              alpha: 1,
            ); // обычная
          },
        ),
        foregroundColor: WidgetStateProperty.all(
          colorScheme.onPrimary,
        ),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            side: BorderSide(
              width: 0.5,
              color: AppColors.white.value.withValues(
                alpha: 0.2,
              ),
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        padding: WidgetStateProperty.all(
          padding ??
              const EdgeInsets.symmetric(
                vertical: 10.0,
              ),
        ),
      ),
      child: child,
    );
  }
}
