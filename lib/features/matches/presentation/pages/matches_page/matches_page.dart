import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../../../core/di/injection.dart';
import '../../../../../core/routes/init_router/init_router.dart';
import '../../../../../core/services/ui_message_service.dart';
import '../../../../../core/widgets/padding/horizontal_padding.dart';
import '../../../../chat/data/services/chat_filter_service.dart';
import '../../../../chat/data/utils/extensions/chats_filter_state_ext.dart';
import '../../../../chat/domain/models/chat/chat.dart';
import '../../../../chat/domain/models/e_chat_filter.dart';
import '../../../../chat/domain/usecases/search_chats_use_case.dart';
import '../../../../chat/domain/usecases/toggle_archive_chat_use_case.dart';
import '../../../../chat/domain/usecases/toggle_favorite_chat_use_case.dart';
import '../../../../chat/presentation/bloc/chat_bloc/chat_bloc.dart';
import '../../../../onboard_survey/presentation/pages/onboard_survey_page/stages/specialization_stage/widgets/search_input.dart';
import '../../../../chat/presentation/bloc/chats_filter_bloc/chats_filter_bloc.dart';
import 'widgets/build_chat_filters/build_chat_filters.dart';
import 'widgets/chats_builder/chats_builder.dart';
import 'widgets/chats_builder/widgets/build_chats_empty.dart';
import 'widgets/chats_builder/widgets/chat_actions_dialog.dart';

class MatchesPage extends StatefulWidget {
  const MatchesPage({super.key});

  @override
  State<MatchesPage> createState() => _MatchesPageState();
}

class _MatchesPageState extends State<MatchesPage> {
  final ChatsFilterBloc _chatsFilterBloc =
      ChatsFilterBloc(
        searchChatsUseCase: getIt<SearchChatsUseCase>(),
        toggleArchiveChatUseCase: getIt<ToggleArchiveChatUseCase>(),
        toggleFavoriteChatUseCase: getIt<ToggleFavoriteChatUseCase>(),
      )..add(
        ChatsFilterEvent.search(
          query: '',
        ),
      );

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

  void onChangedQuery(String query) {
    _chatsFilterBloc.add(
      ChatsFilterEvent.search(
        query: query,
      ),
    );
  }

  void _showChatActions(Chat chat) {
    ChatActionsDialog.show(
      context,
      chat: chat,
      onArchive: () => _chatsFilterBloc.add(
        ChatsFilterEvent.toggleArchived(
          chat: chat,
        ),
      ),
      onFavorite: () => _chatsFilterBloc.add(
        ChatsFilterEvent.toggleFavorite(
          chat: chat,
        ),
      ),
      onMute: () {
        // TODO: Implement mute logic
      },
      onDelete: () {
        // TODO: Implement delete logic
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _chatsFilterBloc,
      child: BlocListener<ChatsFilterBloc, ChatsFilterState>(
        listener: (context, state) {
          if (state.isFailed) {
            UiMessageService.showError(
              state.errorMessage,
            );
          } else if (state.isArchived) {
            UiMessageService.showInfo(
              'Chat unarchived successfully',
            );
          } else if (state.isUnArchived) {
            UiMessageService.showInfo(
              'Chat unarchived successfully',
            );
          } else if (state.isFavorite) {
            UiMessageService.showInfo(
              'Added to favorites',
            );
          } else if (state.isFavorite) {
            UiMessageService.showInfo(
              'Removed from favorites',
            );
          }
        },
        child: HorizontalPadding(
          child: Scaffold(
            backgroundColor: Colors.transparent,

            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SearchInput(
                  hintText: 'Search matches...',
                  onChanged: onChangedQuery,
                ),
                Gap(20.0),
                BuildChatFilters(
                  onTapChatFilter: onTapChatFilter,
                ),
                Gap(20.0),
                Expanded(
                  child: BlocBuilder<ChatsFilterBloc, ChatsFilterState>(
                    builder: (context, state) {
                      final chats = state.chats;

                      if (state.status == ChatsFilterStatus.failed) {
                        return Text(
                          'Failed load data: ${state.errorMessage}',
                        );
                      }
                      if (state.status == ChatsFilterStatus.initial &&
                          state.chats.isEmpty) {
                        return BuildChatsEmpty();
                      }

                      return ChatsBuilder(
                        onReachToEnd: onReachChatsToEnd,
                        onTapChat: onTapChat,
                        chats: chats,
                        showChatActions: _showChatActions,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
