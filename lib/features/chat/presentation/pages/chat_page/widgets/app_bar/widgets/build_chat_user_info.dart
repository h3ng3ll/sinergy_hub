import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../../../../../../core/resources/colors/app_colors.dart';
import '../../../../../../../../core/resources/text/app_text_theme.dart';
import '../../../../../../../../core/widgets/build_user_avatar.dart';
import '../../../bloc/chat_page_bloc/chat_page_bloc.dart';

class BuildChatUserInfo extends StatelessWidget {
  final VoidCallback onTapUser;

  const BuildChatUserInfo({
    super.key,
    required this.onTapUser,
  });

  @override
  Widget build(BuildContext context) {
    final chatPageBloc = context.watch<ChatPageBloc>().state;
    final chat = chatPageBloc.chat;

    final textTheme = AppTextTheme.of(context);
    if (chat?.user == null) {
      return Container();
    }

    return Row(
      children: [
        BuildUserAvatar(
          width: 45.0,
          height: 45.0,
          url: chat!.user.avatarUrl,
        ),
        Gap(10.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${chat.user.firstName}',
              style: textTheme.medium16.copyWith(
                color: AppColors.black.value,
              ),
            ),
            Text(
              chatPageBloc.isOnlineUser ? 'Online now' : 'Offline now',
              style: textTheme.medium16.copyWith(
                color: chatPageBloc.isOnlineUser
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
