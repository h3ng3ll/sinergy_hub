import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../../../core/resources/colors/app_color_scheme.dart';
import '../../../../../../../../core/resources/colors/app_colors.dart';
import '../../../../../../../../core/resources/colors/app_gradients.dart';
import '../../../../../../../../gen/assets.gen.dart';

class BuildSendBtn extends StatelessWidget {
  final VoidCallback onTap;
  final bool isBlocked;

  const BuildSendBtn({
    super.key,
    required this.onTap,
    this.isBlocked = false,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColorScheme.of(context);

    return InkWell(
      onTap: isBlocked ? null : onTap,
      child: Container(
        width: 50.0,
        height: 50.0,
        padding: EdgeInsets.all(
          15.0,
        ),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: isBlocked ? null : AppGradients.bluePurple,
          color: isBlocked
              ? AppColors.tartOrange.value.withValues(alpha: 0.4)
              : null,
        ),
        child: SvgPicture.asset(
          Assets.icons.telegram,
          colorFilter: ColorFilter.mode(
            isBlocked
                ? colorScheme.onPrimary.withValues(alpha: 0.5)
                : colorScheme.onPrimary,
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }
}
