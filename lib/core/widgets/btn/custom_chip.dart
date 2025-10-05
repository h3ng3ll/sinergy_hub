import 'package:flutter/material.dart';

import '../../resources/colors/app_colors.dart';

class CustomChip extends StatelessWidget {
  final bool selected;
  final Widget label;
  final VoidCallback? onTap;
  final double? width;

  const CustomChip({
    super.key,

    required this.selected,
    required this.label,
    required this.onTap,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(
      25.0,
    );
    return InkWell(
      borderRadius: borderRadius,
      onTap: onTap,
      child: Container(
        width: width,
        padding: EdgeInsets.symmetric(
          vertical: 10.0,
          horizontal: 15.0,
        ),
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          color: onTap == null
              /// is inactive
              ? AppColors.white.value.withValues(alpha: 0.3)
              : selected
              ? null
              : AppColors.white.value,
          gradient: !selected
              ? null
              : LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    AppColors.royalBlue.value,
                    AppColors.darkOrchid.value,
                  ],
                ),
        ),
        child: label,
      ),
    );
  }
}
