import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../../../../../../../../core/resources/colors/app_color_scheme.dart';
import '../../../../../../../../core/resources/colors/app_colors.dart';
import '../../../../../../../../core/resources/text/app_text_theme.dart';
import '../../../../../../../../core/resources/translations/app_localizations.dart';
import '../../../../../../../../core/utils/initials.dart';
import '../../../../../../../../core/widgets/build_user_avatar.dart';
import '../../../../../../../../core/widgets/wide/avatar_ring.dart';
import '../../../../../../../../gen/assets.gen.dart';
import '../../../../../../../user/domain/models/user_data/user_data.dart';

class BuildChatUserInfo extends StatelessWidget {
  final VoidCallback onTapUser;
  final UserData user;

  /// Tablet/desktop: ringed avatar with status dot + status pill.
  final bool wide;

  const BuildChatUserInfo({
    super.key,
    required this.onTapUser,
    required this.user,
    this.wide = false,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = AppTextTheme.of(context);
    final lo = AppLocalizations.of(context)!;

    if (wide) {
      return MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: onTapUser,
          behavior: HitTestBehavior.opaque,
          child: Row(
            spacing: 12.0,
            children: [
              AvatarRing(
                url: user.avatarUrl,
                initials: initialsOf([user.firstName, user.lastName]),
                size: 34.0,
                showEditBadge: false,
                statusOnline: user.isOnline,
              ),
              Flexible(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 2.0,
                  children: [
                    Text(
                      '${user.firstName}',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: textTheme.bold16.copyWith(
                        color: AppColors.jacarta.value,
                      ),
                    ),
                    Text(
                      user.isOnline ? lo.chat_online_now : lo.chat_offline_now,
                      style: textTheme.regular12.copyWith(
                        color: user.isOnline
                            ? AppColors.greenCrayola.value
                            : AppColors.darkBlueGray.value,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Row(
      children: [
        user.avatarUrl == null
            ? GestureDetector(
                onTap: onTapUser,
                child: SvgPicture.asset(
                  Assets.icons.user,
                  width: 30,
                  height: 30,
                  colorFilter: ColorFilter.mode(
                    AppColors.greyLight.value,
                    BlendMode.srcIn,
                  ),
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
              user.isOnline ? lo.chat_online_now : lo.chat_offline_now,
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
