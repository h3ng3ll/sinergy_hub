import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';

import '../../../../../../../core/resources/colors/app_colors.dart';
import '../../../../../../../core/utils/extensions/go_router_x.dart';
import '../../../../../../../core/widgets/custom_app_bar.dart';
import '../../../../../../user/domain/models/user_data/user_data.dart';
import 'widgets/build_chat_user_info.dart';
import 'widgets/chat_block_menu.dart';
import 'widgets/chat_header_wide.dart';

class ChatAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback onTapUser;
  final VoidCallback onToggleBlock;
  final bool isBlocked;
  final UserData user;

  /// Tablet/desktop: light header with a hairline divider.
  final bool wide;

  const ChatAppBar({
    super.key,
    required this.onTapUser,
    required this.onToggleBlock,
    required this.isBlocked,
    required this.user,
    this.wide = false,
  });

  @override
  Widget build(BuildContext context) {
    if (wide) {
      return ChatHeaderWide(
        onTapUser: onTapUser,
        onToggleBlock: onToggleBlock,
        isBlocked: isBlocked,
        user: user,
      );
    }

    return Padding(
      padding: EdgeInsets.only(
        top: MediaQuery.paddingOf(context).top,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white.value,
          boxShadow: [
            BoxShadow(
              color: AppColors.black.value.withValues(
                alpha: 0.4,
              ),
              offset: Offset(
                0,
                2,
              ),
              blurRadius: 5,
            ),
          ],
        ),
        child: MediaQuery.removePadding(
          context: context,
          removeTop: true,
          child: CustomAppBar(
            systemOverlayStyle: SystemUiOverlayStyle.dark,
            backgroundColor: Colors.transparent,
            forceMaterialTransparency: true,
            shadowColor: AppColors.black.value,
            leadingWidth: 50,
            leading: InkWell(
              onTap: context.goBack,
              child: Icon(
                Icons.arrow_back,
                color: AppColors.black.value,
              ),
            ),
            actions: [
              Gap(50.0),
              Spacer(),
              BuildChatUserInfo(
                onTapUser: onTapUser,
                user: user,
              ),
              Spacer(),
              ChatBlockMenu(
                isBlocked: isBlocked,
                onToggleBlock: onToggleBlock,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(wide ? 68.0 : 50.0);
}
