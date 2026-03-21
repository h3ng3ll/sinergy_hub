import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../../../../../../../../core/resources/colors/app_color_scheme.dart';
import '../../../../../../../../core/resources/text/app_text_theme.dart';
import '../../../../../../../../gen/assets.gen.dart';
import '../../../../../../../chat/domain/models/chat/chat.dart';
import '../../../../../../../onboard_survey/presentation/pages/onboard_survey_page/widgets/translucent_card_container.dart';
import '../../../../../../../../core/widgets/build_user_avatar.dart';
import '../../../../../../../user/presentation/bloc/user_bloc/user_bloc.dart';
import '../../../../discovery_page/widgets/build_tinder_card/widgets/build_top_tinder_card_builder/widget/tinder_card_item/widgets/tinder_card_personal_info/widgets/specialization_info_bar.dart';

class ChatTileItem extends StatelessWidget {
  final Chat chat;
  final VoidCallback onTap;
  final VoidCallback? onLongPress;

  const ChatTileItem({
    super.key,
    required this.chat,
    required this.onTap,
    this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColorScheme.of(context);
    final textTheme = AppTextTheme.of(context);
    final uid = context.watch<UserBloc>().state.userData!.uid;

    final cover = chat.cover(
      uid,
    );
    final specialization = chat.specialization(
      uid,
    );

    return TranslucentCardContainer(
      onTap: onTap,
      onLongPress: onLongPress,
      child: Row(
        children: [
          cover == null
              ? SizedBox(
                  width: 80.0,
                  height: 80.0,
                  child: Center(
                    child: SvgPicture.asset(
                      Assets.icons.user,
                      width: 40.0,
                      height: 40.0,
                      colorFilter: ColorFilter.mode(
                        colorScheme.onPrimary.withValues(
                          alpha: 0.6,
                        ),
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                )
              : BuildUserAvatar(
                  width: 80.0,
                  height: 80.0,
                  url: cover,
                ),
          Gap(10.0),
          Column(
            spacing: 10.0,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                chat.otherUser(uid)?.name ?? 'Unknown',
                style: textTheme.bold16.copyWith(
                  color: colorScheme.onPrimary,
                ),
              ),
              Text(
                chat.lastMessage,
                maxLines: 1,
                style: textTheme.regular12.copyWith(
                  color: colorScheme.onPrimary,
                ),
              ),
              if (specialization != null)
                SpecializationInfoBar(
                  specialization: specialization,
                ),
            ],
          ),
        ],
      ),
    );
  }
}
