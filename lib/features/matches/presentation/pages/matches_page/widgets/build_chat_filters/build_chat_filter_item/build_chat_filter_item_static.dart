import 'package:flutter/material.dart';

import '../../../../../../../../core/resources/colors/app_colors.dart';

class BuildChatFilterItemStatic extends StatelessWidget {
  final Widget child;
  final VoidCallback onTap;

  const BuildChatFilterItemStatic({
    super.key,
    required this.child, required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(7.5),
        decoration: BoxDecoration(
          color: AppColors.ghostWhite.value.withValues(alpha: 0.5),
          borderRadius: BorderRadius.circular(
            15.5,
          ),
        ),
        child: child,
      ),
    );
  }
}
