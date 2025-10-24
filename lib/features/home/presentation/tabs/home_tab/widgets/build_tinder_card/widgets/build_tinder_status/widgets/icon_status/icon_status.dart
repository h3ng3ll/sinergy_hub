import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../../../../../../core/resources/colors/app_colors.dart';

class IconStatus extends StatelessWidget {
  final String icon;
  final Color color;
  final VoidCallback? onTap;
  final double? transparency;
  final double? width;
  final double? height;

  const IconStatus({
    super.key,
    required this.icon,
    required this.color,
     this.width,
    this.onTap,
    this.height,
    this.transparency,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width ?? 70.0,
        height: height ?? 70.0,
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
