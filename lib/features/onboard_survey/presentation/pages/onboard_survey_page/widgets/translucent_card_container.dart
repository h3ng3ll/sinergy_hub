import 'package:flutter/material.dart';

import '../../../../../../core/resources/colors/app_colors.dart';

class TranslucentCardContainer extends StatelessWidget {
  final Widget child;
  final double? height;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;

  const TranslucentCardContainer({
    super.key,
    required this.child,
    this.height,
    this.onTap,
    this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: onLongPress,
      onTap: onTap,
      child: Container(
        height: height,
        padding: EdgeInsets.all(
          17.5,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            12.0,
          ),
          color: AppColors.white.value.withValues(
            alpha: 0.15,
          ),
          border: Border.all(
            width: 0.5,
            color: AppColors.white.value.withValues(
              alpha: 0.2,
            ),
          ),
        ),

        child: child,
      ),
    );
  }
}
