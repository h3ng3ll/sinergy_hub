import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../../../../core/resources/colors/app_color_scheme.dart';
import '../../../../../../../../core/resources/text/app_text_theme.dart';
import '../../../../../../../chat/domain/models/chat/chat.dart';
import '../../../../../../../onboard_survey/domain/models/specializations/specializations.dart';
import '../../../../../../../onboard_survey/presentation/pages/onboard_survey_page/widgets/translucent_card_container.dart';
import '../../../../../../../home/presentation/tabs/home_tab/widgets/build_tinder_card/widgets/build_top_tinder_card_builder/widget/tinder_card_item/widgets/build_user_avatar.dart';
import '../../../../../../../home/presentation/tabs/home_tab/widgets/build_tinder_card/widgets/build_top_tinder_card_builder/widget/tinder_card_item/widgets/tinder_card_personal_info/widgets/specialization_info_bar.dart';

class ChatTileItem extends StatelessWidget {
  final Chat chat;
  final VoidCallback onTap;

  const ChatTileItem({
    super.key,
    required this.chat,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColorScheme.of(context);
    final textTheme = AppTextTheme.of(context);
    return TranslucentCardContainer(
      onTap: onTap,
      child: Row(
        children: [
          BuildUserAvatar(
            width: 80.0,
            height: 80.0,
            url: chat.user.avatarUrl,
          ),
          Gap(10.0),
          Column(
            spacing: 10.0,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${chat.user.firstName} ${chat.user.lastName ?? ''}',
                style: textTheme.bold16.copyWith(
                  color: colorScheme.onPrimary,
                ),
              ),
              Text(
                '${chat.lastMessage} ${chat.user.firstName} ',
                maxLines: 1,
                style: textTheme.regular12.copyWith(
                  color: colorScheme.onPrimary,
                ),
              ),
              SpecializationInfoBar(
                specialization: Specializations.get(
                  chat.user.profiler.specialization,
                ),
              ),
            ],
          ),

        ],
      ),
    );
  }
}
