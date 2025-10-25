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
}
