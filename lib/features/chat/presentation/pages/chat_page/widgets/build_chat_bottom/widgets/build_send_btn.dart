import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../../../core/resources/colors/app_color_scheme.dart';
import '../../../../../../../../core/resources/colors/app_gradients.dart';
import '../../../../../../../../gen/assets.gen.dart';

class BuildSendBtn extends StatelessWidget {
  final VoidCallback onTap;

  const BuildSendBtn({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColorScheme.of(context);

    return InkWell(
      onTap: onTap,
      child: Container(
        width: 50.0,
        height: 50.0,
        padding: EdgeInsets.all(
          15.0,
        ),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: AppGradients.bluePurple,
        ),
        child: SvgPicture.asset(
          Assets.icons.telegram,
          colorFilter: ColorFilter.mode(
            colorScheme.onPrimary,
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }
}
