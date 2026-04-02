import 'package:flutter/material.dart';

import '../../../../../../core/resources/colors/app_colors.dart';

class BuildOnlineIndicator extends StatelessWidget {
  final bool isOnline;

  const BuildOnlineIndicator({
    super.key,
    required this.isOnline,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20.0,
      height: 20.0,
      decoration: BoxDecoration(
        color: isOnline
            ? AppColors.greenCrayola.value
            : AppColors.heartRed.value,
        shape: BoxShape.circle,
      ),
    );
  }
}
