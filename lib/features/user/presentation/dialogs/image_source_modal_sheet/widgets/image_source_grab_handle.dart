import 'package:flutter/material.dart';

import '../../../../../../core/resources/colors/app_colors.dart';

class ImageSourceGrabHandle extends StatelessWidget {
  const ImageSourceGrabHandle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40.0,
      height: 4.0,
      decoration: BoxDecoration(
        color: AppColors.jacarta.value.withValues(alpha: 0.35),
        borderRadius: BorderRadius.circular(2.0),
      ),
    );
  }
}
