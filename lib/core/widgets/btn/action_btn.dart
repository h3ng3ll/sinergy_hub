import 'package:flutter/material.dart';

import '../../resources/colors/app_color_scheme.dart';
import '../../resources/colors/app_colors.dart';
import '../../resources/text/app_text_theme.dart';

class ActionBtn extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget? child;
  final EdgeInsets? padding;
  final Map<WidgetState, Color> colors;
  final Color? anyStateColor;
  final String? text;
  final BorderSide? border;
  final BorderRadius? borderRadius;
  final bool _filled;

  const ActionBtn({
    super.key,
    required this.onPressed,
    this.child,
    this.padding,
    this.colors = const {},
    this.anyStateColor,
    this.text,
    this.border,
    this.borderRadius,
  }) : _filled = false,
       assert(
         text != null || child != null,
       );

  /// Solid [AppColorScheme.primary] background, so the [AppColorScheme.onPrimary]
  /// label stays readable on light or gradient surfaces.
  const ActionBtn.filled({
    super.key,
    required this.onPressed,
    this.child,
    this.padding,
    this.colors = const {},
    this.text,
    this.border,
    this.borderRadius,
  }) : _filled = true,
       anyStateColor = null,
       assert(
         text != null || child != null,
       );

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColorScheme.of(context);
    final textTheme = AppTextTheme.of(context);
    final isActive = onPressed != null;

    final color = isActive
        ? colorScheme.onPrimary
        : colorScheme.onPrimary.withValues(
            alpha: 0.4,
          );

    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.resolveWith<Color>(
          (states) {
            if (states.contains(WidgetState.disabled)) {
              if (colors.containsKey(WidgetState.disabled)) {
                return colors[WidgetState.disabled]!;
              }
              return AppColors.white.value.withValues(
                alpha: 0.1,
              ); // выключенная
            }
            // if (states.contains(WidgetState.pressed)) {
            //   return AppColors.royalBlue.value; // при нажатии
            // }
            if (anyStateColor != null) {
              return anyStateColor!;
            }
            if (_filled) {
              return colorScheme.primary;
            }
            return AppColors.white.value.withValues(
              alpha: 1,
            ); // обычная
          },
        ),
        foregroundColor: WidgetStateProperty.all(
          colorScheme.onPrimary,
        ),
        shadowColor: WidgetStateProperty.all(
          Colors.black.withValues(
            alpha: 0.1,
          ),
        ),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            side:
                border ??
                BorderSide(
                  width: 0.5,
                  color: AppColors.white.value.withValues(
                    alpha: 0.2,
                  ),
                ),
            borderRadius:
                borderRadius ??
                BorderRadius.circular(
                  12.0,
                ),
          ),
        ),
        padding: WidgetStateProperty.all(
          padding ??
              const EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: 20.0,
              ),
        ),
      ),
      child: text == null
          ? child
          : Text(
              text!,
              style: textTheme.regular14.copyWith(
                color: color,
              ),
            ),
    );
  }
}
