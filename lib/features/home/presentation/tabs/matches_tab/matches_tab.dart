import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../../../core/resources/colors/app_color_scheme.dart';
import '../../../../../core/resources/text/app_text_theme.dart';
import '../../../../../core/routes/init_router/init_router.dart';
import '../../../../../core/widgets/btn/custom_chip.dart';
import '../../../../../core/widgets/padding/horizontal_padding.dart';
import '../../../../chat/domain/models/chat/chat.dart';
import '../../../../chat/domain/models/e_chat_filter.dart';
import '../../../../onboard_survey/presentation/pages/onboard_survey_page/stages/specialization_stage/widgets/search_input.dart';
import 'bloc/chats_filter_bloc/chats_filter_bloc.dart';
import 'widgets/build_chat_filters/build_chat_filters.dart';
import 'widgets/chats_builder/chats_builder.dart';

class MatchesTab extends StatefulWidget {
  const MatchesTab({super.key});

  @override
  State<MatchesTab> createState() => _MatchesTabState();
}

class _MatchesTabState extends State<MatchesTab> {
  final ChatsFilterBloc _chatsFilterBloc = ChatsFilterBloc();

  @override
  void dispose() {
    _chatsFilterBloc.close();
    super.dispose();
  }

  void onReachChatsToEnd() {}

  void onTapChat(Chat chat) {
    ChatPageRoute(
      chatId: chat.chatId,
    ).push(
      context,
    );
  }

  void onTapChatFilter(EChatFilter filter) {
    _chatsFilterBloc.add(
      ChatsFilterEvent.applyFilter(
        filter: filter,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColorScheme.of(context);
    final textTheme = AppTextTheme.of(context);
    return BlocProvider.value(
      value: _chatsFilterBloc,
      child: HorizontalPadding(
        child: Scaffold(
          backgroundColor: Colors.transparent,

          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SearchInput(
                hintText: 'Search matches...',
              ),
              Gap(20.0),
              BuildChatFilters(
                onTapChatFilter: onTapChatFilter,
              ),
              Gap(20.0),
              Expanded(
                child: ChatsBuilder(
                  onReachToEnd: onReachChatsToEnd,
                  onTapChat: onTapChat,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
