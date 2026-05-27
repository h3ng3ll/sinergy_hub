import 'package:flutter/material.dart';

import '../../../../../../core/resources/colors/app_colors.dart';

class ImageSourceDivider extends StatelessWidget {
  const ImageSourceDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1.0,
      margin: const EdgeInsets.symmetric(horizontal: 20.0),
      color: AppColors.jacarta.value.withValues(alpha: 0.15),
    );
  }
}
