import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../gen/assets.gen.dart';
import '../../resources/colors/app_color_scheme.dart';
import '../../resources/colors/app_colors.dart';

class CustomBackBtn extends StatelessWidget {
  final VoidCallback onTap;
  final double? width;
  final double? height;

  const CustomBackBtn({
    super.key,
    required this.onTap,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColorScheme.of(context);

    return GestureDetector(
      onTap: onTap,
      child: Container(


        padding: EdgeInsets.all(
          14.0,
        ),
        decoration: BoxDecoration(
          color: AppColors.white.value.withValues(
            alpha: 0.15,
          ),
          shape: BoxShape.circle,
          border: Border.all(
            width: 0.5,
            color: AppColors.white.value.withValues(
              alpha: 0.2,
            ),
          ),
        ),
        child: SvgPicture.asset(
          Assets.icons.arrowLeftOutlined,
          width: width ?? 30.0,
          height: height ?? 30.0,
          colorFilter: ColorFilter.mode(
            colorScheme.secondary,
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }
}
