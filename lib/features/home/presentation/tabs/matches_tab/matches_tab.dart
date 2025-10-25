import 'package:flutter/material.dart';

import '../../../../../core/resources/colors/app_color_scheme.dart';
import '../../../../../core/resources/text/app_text_theme.dart';
import '../../../../../core/routes/init_router/init_router.dart';
import '../../../../../core/widgets/btn/custom_chip.dart';
import '../../../../../core/widgets/padding/horizontal_padding.dart';
import '../../../../chat/domain/models/chat/chat.dart';
import '../../../../onboard_survey/presentation/pages/onboard_survey_page/stages/specialization_stage/widgets/search_input.dart';
import 'widgets/chats_builder/chats_builder.dart';

class MatchesTab extends StatefulWidget {
  const MatchesTab({super.key});

  @override
  State<MatchesTab> createState() => _MatchesTabState();
}

class _MatchesTabState extends State<MatchesTab> {
  void onTapNotifications() {}

  void onReachChatsToEnd() {}

  void onTapChat(Chat chat) {
    ChatPageRoute(
      chatId: chat.chatId,
    ).push(
      context,
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColorScheme.of(context);
    final textTheme = AppTextTheme.of(context);
    return HorizontalPadding(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          actions: [
            InkWell(
              onTap: onTapNotifications,
              child: Icon(
                Icons.notifications,
                color: colorScheme.secondary,
              ),
            ),
            Icon(
              Icons.more_vert,
            ),
          ],
        ),
        body: Column(
          children: [
            SearchInput(
              hintText: 'Search matches...',
            ),
            Wrap(
              children: [
                CustomChip(
                  selected: false,
                  label: Text(
                    'Recent',
                  ),
                  onTap: () {},
                ),
              ],
            ),
            Expanded(
              child: ChatsBuilder(
                onReachToEnd: onReachChatsToEnd,
                onTapChat: onTapChat,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
