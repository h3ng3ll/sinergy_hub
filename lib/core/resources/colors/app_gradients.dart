//
//
import 'package:flutter/material.dart';

import 'app_colors.dart';

abstract class AppGradients {
  static LinearGradient bluePurple = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      AppColors.royalBlue.value,
      AppColors.darkOrchid.value,
    ],
  );

  static LinearGradient blackToTransparent = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      AppColors.transparent.value,
      AppColors.black.value.withValues(alpha: 0.7),
    ],
  );
}
