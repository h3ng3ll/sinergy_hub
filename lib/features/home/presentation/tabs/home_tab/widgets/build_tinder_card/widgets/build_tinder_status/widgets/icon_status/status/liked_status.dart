import 'package:flutter/material.dart';

import '../../../../../../../../../../../../core/resources/colors/app_colors.dart';
import '../../../../../../../../../../../../gen/assets.gen.dart';
import '../icon_status.dart';

class LikedStatus extends StatelessWidget {
  final VoidCallback? onTap;
  final double? transparency;

  const LikedStatus({
    super.key,
    this.onTap,
    this.transparency,
  });

  @override
  Widget build(BuildContext context) {
    return IconStatus(
      onTap: onTap,
      icon: Assets.icons.liked,
      transparency: transparency,
      color: AppColors.greenCrayola.value,
    );
  }
}
