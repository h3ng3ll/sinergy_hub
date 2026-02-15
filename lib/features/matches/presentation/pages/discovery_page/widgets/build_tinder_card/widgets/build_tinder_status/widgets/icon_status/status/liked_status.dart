import 'package:flutter/material.dart';

import '../../../../../../../../../../../../core/resources/colors/app_colors.dart';
import '../../../../../../../../../../../../gen/assets.gen.dart';
import '../icon_status.dart';

class LikedStatus extends StatelessWidget {
  final VoidCallback? onTap;
  final double? transparency;
  final Color? color;
  final double? width;
  final double? height;

  const LikedStatus({
    super.key,
    this.onTap,
    this.transparency,
    this.width,
    this.color,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return IconStatus(
      onTap: onTap,
      width: width,
      height: height,
      icon: Assets.icons.liked,
      transparency: transparency,
      color: color ?? AppColors.greenCrayola.value,
    );
  }
}
