import 'package:flutter/material.dart';

import '../../../../../../core/resources/colors/app_color_scheme.dart';
import '../../../../../../core/resources/colors/app_colors.dart';
import '../../../../../../core/resources/text/app_text_theme.dart';

class PaletteColorSwatch extends StatelessWidget {
  final Color color;
  final String label;
  final VoidCallback onTap;

  const PaletteColorSwatch({
    super.key,
    required this.color,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColorScheme.of(context);
    final textTheme = AppTextTheme.of(context);

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 8.0,
        children: [
          Container(
            width: 56.0,
            height: 56.0,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
              border: Border.all(
                color: AppColors.white.value,
                width: 3.0,
              ),
              boxShadow: [
                BoxShadow(
                  color: AppColors.black.value.withValues(alpha: 0.2),
                  blurRadius: 8.0,
                  offset: const Offset(0.0, 3.0),
                ),
              ],
            ),
          ),
          Text(
            label,
            style: textTheme.regular14.copyWith(
              color: colorScheme.onPrimary,
            ),
          ),
        ],
      ),
    );
  }
}
