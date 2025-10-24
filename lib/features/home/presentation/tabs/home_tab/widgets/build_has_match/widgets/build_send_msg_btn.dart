import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../../../core/resources/colors/app_color_scheme.dart';
import '../../../../../../../../core/resources/colors/app_colors.dart';
import '../../../../../../../../core/resources/text/app_text_theme.dart';
import '../../../../../../../../core/widgets/btn/action_btn.dart';
import '../../../../../../../../gen/assets.gen.dart';

class BuildSendMsgBtn extends StatelessWidget {
  final VoidCallback onSendMessage;

  const BuildSendMsgBtn({
    super.key,
    required this.onSendMessage,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColorScheme.of(context);
    final textTheme = AppTextTheme.of(context);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          25.0,
        ),
        gradient: LinearGradient(
          colors: [
            AppColors.hotPink.value,
            AppColors.majorelleBlue.value,
          ],
        ),
      ),
      child: ActionBtn(
        anyStateColor: Colors.transparent,
        onPressed: onSendMessage,
        border: BorderSide.none,
        child: Row(
          spacing: 10.0,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              Assets.icons.telegram,
              width: 20.0,
              height: 20.0,
              colorFilter: ColorFilter.mode(
                colorScheme.onPrimary,
                BlendMode.srcIn,
              ),
            ),

            Text(
              'Send Message',
              style: textTheme.medium16.copyWith(
                color: colorScheme.onPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
