import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../../../core/resources/colors/app_colors.dart';
import '../../../../../../../core/resources/translations/app_localizations.dart';
import '../../../../../../../core/utils/extensions/go_router_x.dart';
import '../../../../../../../core/widgets/custom_app_bar.dart';
import '../../../../../../../core/widgets/custom_popup_menu.dart';
import '../../../../../../user/domain/models/user_data/user_data.dart';
import 'widgets/build_chat_user_info.dart';

class ChatAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback onTapUser;
  final VoidCallback onToggleBlock;
  final bool isBlocked;
  final UserData user;

  const ChatAppBar({
    super.key,
    required this.onTapUser,
    required this.onToggleBlock,
    required this.isBlocked,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

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
      child: CustomAppBar(
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
          CustomPopupMenu<bool>(
            icon: Icon(
              Icons.more_vert,
              color: AppColors.black.value,
            ),
            color: AppColors.white.value,
            items: const [true],
            onSelected: (_) => onToggleBlock(),
            itemBuilder: (context, _) => CustomPopupMenuItem<bool>.withIcon(
              value: true,
              icon: isBlocked ? Icons.lock_open : Icons.block,
              iconColor: AppColors.tartOrange.value,
              text: isBlocked ? l10n.unblock_user : l10n.block_user,
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
