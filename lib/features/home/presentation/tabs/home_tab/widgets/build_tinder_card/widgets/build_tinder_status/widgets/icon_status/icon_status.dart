import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../../../../../../core/resources/colors/app_colors.dart';

class IconStatus extends StatelessWidget {
  final String icon;
  final Color color;
  final VoidCallback? onTap;
  final double? transparency;

  const IconStatus({
    super.key,
    required this.icon,
    required this.color,
    this.onTap,
    this.transparency,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 70.0,
        height: 70.0,
        padding: EdgeInsets.all(
          15.0,
        ),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
        ),
        child: SvgPicture.asset(
          icon,
          colorFilter: ColorFilter.mode(
            AppColors.white.value,
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }
}
