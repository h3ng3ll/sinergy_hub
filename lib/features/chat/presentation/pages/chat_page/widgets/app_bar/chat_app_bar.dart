import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../../core/resources/colors/app_colors.dart';
import 'widgets/build_chat_user_info.dart';

class ChatAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback onTapUser;

  const ChatAppBar({
    super.key,
    required this.onTapUser,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: AppBar(
        backgroundColor: Colors.transparent,
        forceMaterialTransparency: true,
        shadowColor: AppColors.black.value,
        leadingWidth: 50,
        leading: InkWell(
          onTap: () {
            context.pop();
          },
          child: Icon(
            Icons.arrow_back,
          ),
        ),
        actions: [
          Gap(50.0),
          Spacer(),
          BuildChatUserInfo(
            onTapUser: onTapUser,
          ),
          Spacer(),
          InkWell(
            child: Icon(
              Icons.more_vert,
            ),
          ),
        ],
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(50.0);
}
