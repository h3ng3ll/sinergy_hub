import 'package:flutter/material.dart';

import '../../../../../../../../../../../../core/resources/colors/app_colors.dart';
import '../../../../../../../../../../../../gen/assets.gen.dart';

import '../icon_status.dart';

class RejectStatus extends StatelessWidget {
  final VoidCallback? onTap;
  final double? transparency;

  const RejectStatus({
    super.key,
    this.onTap,
    this.transparency,
  });

  @override
  Widget build(BuildContext context) {
    return IconStatus(
      onTap: onTap,
      transparency: transparency,
      icon: Assets.icons.close,
      color: AppColors.metallicOrange.value,
    );
  }
}
