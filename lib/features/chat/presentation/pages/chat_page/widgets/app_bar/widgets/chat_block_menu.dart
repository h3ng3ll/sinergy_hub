import 'package:flutter/material.dart';

import '../../../../../../../../core/resources/colors/app_colors.dart';
import '../../../../../../../../core/resources/translations/app_localizations.dart';
import '../../../../../../../../core/widgets/custom_popup_menu.dart';

/// The chat header's ⋮ menu with the Block / Unblock toggle.
class ChatBlockMenu extends StatelessWidget {
  final bool isBlocked;
  final VoidCallback onToggleBlock;

  const ChatBlockMenu({
    super.key,
    required this.isBlocked,
    required this.onToggleBlock,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return CustomPopupMenu<bool>(
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
    );
  }
}
