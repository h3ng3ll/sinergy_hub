import 'package:flutter/material.dart';

import '../../../../../../../../core/resources/colors/app_colors.dart';
import '../../../../../../../../core/utils/responsive_helper.dart';

class BuildChatBottomContainer extends StatelessWidget {
  final Widget child;

  const BuildChatBottomContainer({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    if (!ResponsiveHelper.isMobile(context)) {
      return Container(
        padding: const EdgeInsets.symmetric(
          vertical: 12.0,
        ),
        decoration: BoxDecoration(
          color: AppColors.white.value,
          border: Border(
            top: BorderSide(
              color: AppColors.platinum.value,
            ),
          ),
        ),
        child: child,
      );
    }

    return Container(

      padding: EdgeInsets.symmetric(
        vertical: 15.0,
      ),
      decoration: BoxDecoration(
        color: AppColors.white.value,
        boxShadow: [
          BoxShadow(
            color: AppColors.black.value.withValues(
              alpha: 0.7,
            ),
            offset: Offset(
              0,
              -3,
            ),
            blurRadius: 5.0,
            spreadRadius: -2.0,
          ),
        ],
      ),
      child: child,
    );
  }
}
