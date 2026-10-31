import 'package:flutter/material.dart';

import '../../../../../../../../core/resources/colors/app_colors.dart';
import '../../../../../../../../core/resources/text/app_text_theme.dart';
import '../../../../../../../../core/resources/translations/app_localizations.dart';
import '../../../../../../../../core/utils/extensions/date_time_ext.dart';
import '../../../../../../../../core/utils/initials.dart';
import '../../../../../../../../core/widgets/wide/avatar_ring.dart';
import '../../../../../../../../core/widgets/wide/hover_card.dart';
import '../../../../../../../chat/domain/models/chat/chat.dart';
import '../../../../../../../chat/domain/models/participant_info/participant_info.dart';
import '../../../../discovery_page/widgets/build_tinder_card/widgets/build_top_tinder_card_builder/widget/tinder_card_item/widgets/tinder_card_personal_info/widgets/specialization_info_bar.dart';

/// Compact tablet/desktop glass chat row: ringed avatar with status dot, name +
/// last-message time, "You: " prefixed preview and specialization pill.
class ChatTileWide extends StatelessWidget {
  final Chat chat;
  final String uid;
  final VoidCallback onTap;
  final VoidCallback? onLongPress;
  final bool isOnlineUser;
  final ParticipantInfo? otherUser;

  const ChatTileWide({
    super.key,
    required this.chat,
    required this.uid,
    required this.onTap,
    required this.isOnlineUser,
    required this.otherUser,
    this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = AppTextTheme.of(context);
    final lo = AppLocalizations.of(context)!;
    final white = AppColors.white.value;
    final muted = white.withValues(
      alpha: 0.8,
    );
    final name = otherUser?.name ?? lo.chat_unknown_user;
    final specialization = chat.specialization(uid);
    final preview = chat.lastMessage.isEmpty
        ? ''
        : chat.lastMessageSentBy == uid
        ? '${lo.chat_you_prefix} ${chat.lastMessage}'
        : chat.lastMessage;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        onLongPress: onLongPress,
        child: HoverCard(
          translucent: true,
          padding: const EdgeInsets.all(16.0),
          child: Row(
            spacing: 14.0,
            children: [
              AvatarRing(
                url: chat.cover(uid),
                initials: initialsOf(name.split(' ')),
                size: 56.0,
                showEditBadge: false,
                statusOnline: isOnlineUser,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 6.0,
                  children: [
                    Row(
                      spacing: 8.0,
                      children: [
                        Expanded(
                          child: Text(
                            name,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: textTheme.bold16.copyWith(
                              color: white,
                            ),
                          ),
                        ),
                        Text(
                          chat.lastMessageSent.toRelativeLabel(lo),
                          style: textTheme.regular12.copyWith(
                            color: muted,
                          ),
                        ),
                      ],
                    ),
                    if (preview.isNotEmpty)
                      Text(
                        preview,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: textTheme.regular14.copyWith(
                          color: muted,
                        ),
                      ),
                    if (specialization != null)
                      SpecializationInfoBar(
                        specialization: specialization,
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
