import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../../core/resources/colors/app_color_scheme.dart';
import '../../../../../../../../core/resources/text/app_text_theme.dart';
import '../../../../../../../chat/domain/models/chat/chat.dart';
import '../../../../../../../user/presentation/bloc/user_bloc/user_bloc.dart';

/// Dialog that shows available actions for a chat item.
///
/// This dialog is shown when a user long-presses on a chat item.
class ChatActionsDialog extends StatelessWidget {
  final Chat chat;
  final VoidCallback? onArchive;
  final VoidCallback? onFavorite;
  final VoidCallback? onDelete;
  final VoidCallback? onMute;

  const ChatActionsDialog({
    super.key,
    required this.chat,
    this.onArchive,
    this.onFavorite,
    this.onDelete,
    this.onMute,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColorScheme.of(context);
    final textTheme = AppTextTheme.of(context);
    final uid = context.watch<UserBloc>().state.userData!.uid;

    final isArchived = chat.isArchived(
      uid,
    );
    final isFavorite = chat.isFavorite(
      uid,
    );
    final chatName =
        chat.chatName(
          uid,
        ) ??
        '';

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Text(
              'Chat Actions',
              style: textTheme.bold16.copyWith(
                color: colorScheme.onPrimary,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              chatName,
              style: textTheme.regular12.copyWith(
                color: colorScheme.onPrimary.withValues(alpha: 0.7),
              ),
            ),
            const SizedBox(height: 16.0),
            const Divider(),
            const SizedBox(height: 8.0),

            // Actions
            if (onArchive != null)
              _ChatActionTile(
                icon: isArchived ? Icons.unarchive : Icons.archive_outlined,
                title: isArchived ? 'Unarchive' : 'Archive',
                onTap: () {
                  Navigator.of(context).pop();
                  onArchive?.call();
                },
              ),

            if (onFavorite != null)
              _ChatActionTile(
                icon: isFavorite ? Icons.star : Icons.star_border,
                title: isFavorite
                    ? 'Remove from Favorites'
                    : 'Add to Favorites',
                iconColor: isFavorite ? Colors.amber : null,
                onTap: () {
                  Navigator.of(context).pop();
                  onFavorite?.call();
                },
              ),
            ///Todo: Future realization not implemented yet
            // if (onMute != null)
            //   _ChatActionTile(
            //     icon: Icons.notifications_off_outlined,
            //     title: 'Mute Notifications',
            //     onTap: () {
            //       Navigator.of(context).pop();
            //       onMute?.call();
            //     },
            //   ),
            //
            // if (onDelete != null)
            //   _ChatActionTile(
            //     icon: Icons.delete_outline,
            //     title: 'Delete Chat',
            //     iconColor: Colors.red,
            //     titleColor: Colors.red,
            //     onTap: () {
            //       Navigator.of(context).pop();
            //       onDelete?.call();
            //     },
            //   ),

            const SizedBox(height: 8.0),

            // Cancel button
            SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text(
                  'Cancel',
                  style: textTheme.regular12.copyWith(
                    color: colorScheme.onPrimary,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Shows the chat actions dialog.
  static Future<void> show(
    BuildContext context, {
    required Chat chat,
    VoidCallback? onArchive,
    VoidCallback? onFavorite,
    VoidCallback? onDelete,
    VoidCallback? onMute,
  }) {
    return showDialog(
      context: context,
      builder: (context) => ChatActionsDialog(
        chat: chat,
        onArchive: onArchive,
        onFavorite: onFavorite,
        onDelete: onDelete,
        onMute: onMute,
      ),
    );
  }
}

/// Internal widget for displaying a single action tile in the dialog.
class _ChatActionTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color? iconColor;
  final Color? titleColor;
  final VoidCallback onTap;

  const _ChatActionTile({
    required this.icon,
    required this.title,
    this.iconColor,
    this.titleColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColorScheme.of(context);
    final textTheme = AppTextTheme.of(context);

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 12.0,
          horizontal: 8.0,
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: iconColor ?? colorScheme.onPrimary,
              size: 24.0,
            ),
            const SizedBox(width: 16.0),
            Expanded(
              child: Text(
                title,
                style: textTheme.bold16.copyWith(
                  color: titleColor ?? colorScheme.onPrimary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
