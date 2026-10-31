import 'package:flutter/material.dart';

import '../../../../../../../../core/resources/colors/app_colors.dart';
import '../../../../../../../../core/utils/extensions/go_router_x.dart';
import '../../../../../../../user/domain/models/user_data/user_data.dart';
import 'build_chat_user_info.dart';
import 'chat_block_menu.dart';

/// Tablet/desktop chat header: back, peer info on the left, menu on the
/// right, separated from the messages by a hairline instead of a shadow.
class ChatHeaderWide extends StatelessWidget {
  final VoidCallback onTapUser;
  final VoidCallback onToggleBlock;
  final bool isBlocked;
  final UserData user;

  const ChatHeaderWide({
    super.key,
    required this.onTapUser,
    required this.onToggleBlock,
    required this.isBlocked,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    final ink = AppColors.jacarta.value;

    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(
        horizontal: 8.0,
        vertical: 10.0,
      ),
      decoration: BoxDecoration(
        color: AppColors.white.value,
        border: Border(
          bottom: BorderSide(
            color: AppColors.platinum.value,
          ),
        ),
      ),
      child: Row(
        spacing: 8.0,
        children: [
          IconButton(
            onPressed: context.goBack,
            splashRadius: 20.0,
            icon: Icon(
              Icons.arrow_back,
              color: ink,
            ),
          ),
          Expanded(
            child: BuildChatUserInfo(
              onTapUser: onTapUser,
              user: user,
              wide: true,
            ),
          ),
          ChatBlockMenu(
            isBlocked: isBlocked,
            onToggleBlock: onToggleBlock,
          ),
        ],
      ),
    );
  }
}
