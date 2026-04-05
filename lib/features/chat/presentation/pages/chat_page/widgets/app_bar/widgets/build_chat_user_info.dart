import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../../../../../../../../core/resources/colors/app_color_scheme.dart';
import '../../../../../../../../core/resources/colors/app_colors.dart';
import '../../../../../../../../core/resources/text/app_text_theme.dart';
import '../../../../../../../../core/widgets/build_user_avatar.dart';
import '../../../../../../../../gen/assets.gen.dart';
import '../../../../../../../user/domain/models/user_data/user_data.dart';

class BuildChatUserInfo extends StatelessWidget {
  final VoidCallback onTapUser;
  final UserData user;

  const BuildChatUserInfo({
    super.key,
    required this.onTapUser,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = AppTextTheme.of(context);

    return Row(
      children: [
        user.avatarUrl == null
            ? SvgPicture.asset(
                Assets.icons.user,
                width: 30,
                height: 30,
                colorFilter: ColorFilter.mode(
                  AppColors.black.value,
                  BlendMode.srcIn,
                ),
              )
            : BuildUserAvatar(
                onTap: onTapUser,
                width: 45.0,
                height: 45.0,
                url: user.avatarUrl,
              ),
        Gap(10.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${user.firstName}',
              style: textTheme.medium16.copyWith(
                color: AppColors.black.value,
              ),
            ),
            Text(
              user.isOnline ? 'Online now' : 'Offline now',
              style: textTheme.medium16.copyWith(
                color: user.isOnline
                    ? AppColors.greenCrayola.value
                    : AppColors.tartOrange.value,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
