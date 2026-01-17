import 'package:flutter/material.dart';

import '../../../../../../../../core/resources/colors/app_colors.dart';

class BuildChatFilterItemStatic extends StatelessWidget {
  final Widget child;

  const BuildChatFilterItemStatic({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(7.5),
      decoration: BoxDecoration(
        color: AppColors.ghostWhite.value.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(
          15.5,
        ),
      ),
      child: child,
    );
  }
}
