import 'package:flutter/material.dart';

import '../../../../../../core/resources/colors/app_colors.dart';

class BuildHeart extends StatelessWidget {
  final double heartSize;
  final double heartIconSize;

  const BuildHeart({
    super.key,
    required this.heartSize,
    required this.heartIconSize,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: heartSize,
      height: heartSize,
      decoration: BoxDecoration(
        color: AppColors.heartRed.value.withValues(
          alpha: 0.9,
        ),
        shape: BoxShape.circle,
      ),
      child: Icon(
        Icons.favorite,
        color: AppColors.white.value,
        size: heartIconSize,
      ),
    );
  }
}
