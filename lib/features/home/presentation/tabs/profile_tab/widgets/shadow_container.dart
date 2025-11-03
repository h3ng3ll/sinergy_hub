import 'package:flutter/material.dart';

import '../../../../../../core/resources/colors/app_colors.dart';

class ShadowContainer extends StatelessWidget {
  final Widget child;

  const ShadowContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(
        15.0,
      ),
      decoration: BoxDecoration(
        color: AppColors.white.value,
        borderRadius: BorderRadius.circular(
          17.5,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.value.withValues(
              alpha: 0.3,
            ),
            offset: Offset(0, 2),
            // spreadRadius: 1.0,
            blurRadius: 5.0,
          ),
        ],
      ),
      child: child,
    );
  }
}
