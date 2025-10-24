import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../../../core/resources/colors/app_color_scheme.dart';
import '../../../../../../../../core/resources/text/app_text_theme.dart';
import '../../../../../../../../core/widgets/btn/action_btn.dart';
import '../../../../../../../../gen/assets.gen.dart';

class KeepSwipingBtn extends StatelessWidget {
  final VoidCallback onKeepSwiping;

  const KeepSwipingBtn({
    super.key,
    required this.onKeepSwiping,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColorScheme.of(context);
    final textTheme = AppTextTheme.of(context);
    return ActionBtn(
      anyStateColor: Colors.transparent,
      onPressed: onKeepSwiping,
      child: Row(
        spacing: 10.0,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            Assets.icons.recycle,
            width: 20.0,
            height: 20.0,
            colorFilter: ColorFilter.mode(
              colorScheme.onPrimary,
              BlendMode.srcIn,
            ),
          ),

          Text(
            'Keep swiping',
            style: textTheme.medium16.copyWith(
              color: colorScheme.onPrimary,
            ),
          ),
        ],
      ),
    );
  }
}
