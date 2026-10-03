import 'package:flutter/material.dart';

import '../../resources/colors/app_colors.dart';

class ShimmerBox extends StatelessWidget {
  final double? width;
  final double height;
  final double radius;

  const ShimmerBox({
    super.key,
    this.width,
    required this.height,
    this.radius = 8.0,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.platinum.value,
        borderRadius: BorderRadius.circular(radius),
      ),
      child: SizedBox(
        width: width,
        height: height,
      ),
    );
  }
}
