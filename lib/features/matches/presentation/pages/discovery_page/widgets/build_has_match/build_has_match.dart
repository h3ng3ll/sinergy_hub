import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../../../../../../../core/resources/colors/app_color_scheme.dart';
import '../../../../../../../core/resources/colors/app_colors.dart';
import '../../../../../../../core/resources/text/app_text_theme.dart';

import '../../../../../../../core/widgets/btn/custom_text_btn.dart';
import '../../../../../../../gen/assets.gen.dart';
import '../../../../../../onboard_survey/domain/models/specializations/specializations.dart';
import '../../../../../../user/domain/models/user_data/user_data.dart';
import '../build_tinder_card/widgets/build_tinder_status/widgets/icon_status/status/liked_status.dart';
import '../../../../../../../core/widgets/build_user_avatar.dart';
import 'widgets/build_send_msg_btn.dart';
import 'widgets/keep_swiping_btn.dart';
import 'widgets/specialization_container.dart';

class BuildHasMatch extends StatelessWidget {
  final UserData currentUser;
  final UserData matchedUser;
  final VoidCallback onSendMessage;
  final VoidCallback onKeepSwiping;

  const BuildHasMatch({
    super.key,
    required this.currentUser,
    required this.matchedUser,
    required this.onSendMessage,
    required this.onKeepSwiping,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColorScheme.of(context);
    final textTheme = AppTextTheme.of(context);

    return Center(
      child: SizedBox(
        width: 350,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 10.0,
              children: [
                BuildUserAvatar(
                  height: 120.0,
                  width: 120.0,
                  url: currentUser.avatarUrl,
                ),
                LikedStatus(
                  color: AppColors.tartOrange.value,
                  width: 55.0,
                  height: 55.0,
                ),
                BuildUserAvatar(
                  height: 120.0,
                  width: 120.0,
                  url: matchedUser.avatarUrl,
                ),
              ],
            ),
            Gap(20.0),
            Text(
              "You + ${matchedUser.firstName ?? " "}",
              style: textTheme.bold24.copyWith(
                color: colorScheme.onPrimary,
              ),
            ),
            Gap(20.0),
            Row(
              spacing: 10.0,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: SpecializationContainer(
                    specialization: Specializations.get(
                      currentUser.profiler.specialization,
                    ),
                  ),
                ),
                Text(
                  " + ",
                  style: textTheme.bold24.copyWith(
                    color: colorScheme.onPrimary,
                  ),
                ),
                Flexible(
                  child: SpecializationContainer(
                    specialization: Specializations.get(
                      matchedUser.profiler.specialization,
                    ),
                  ),
                ),
              ],
            ),
            Gap(20.0),
            BuildSendMsgBtn(
              onSendMessage: onSendMessage,
            ),
            Gap(20.0),
            KeepSwipingBtn(
              onKeepSwiping: onKeepSwiping,
            ),
            CustomTextBtn(child: Row(
              spacing: 10.0,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  Assets.icons.user,
                  width: 20.0,
                  height: 20.0,
                  colorFilter: ColorFilter.mode(
                    colorScheme.onPrimary,
                    BlendMode.srcIn,
                  ),
                ),

                Text(
                  'View All Profile',
                  style: textTheme.medium16.copyWith(
                    color: colorScheme.secondary,
                  ),
                ),
              ],
            ), onPressed: () {})
          ],
        ),
      ),
    );
  }
}
