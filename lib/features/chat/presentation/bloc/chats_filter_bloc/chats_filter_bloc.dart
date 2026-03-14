import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/utils/extensions/bloc_ext.dart';
import '../../../domain/models/chat/chat.dart';
import '../../../domain/models/chat_pg_state.dart/chat_pg_state.dart';
import '../../../domain/models/e_chat_filter.dart';
import '../../../domain/usecases/listen_chat_updates_use_case.dart';
import '../../../domain/usecases/search_chats_use_case.dart';
import '../../../domain/usecases/toggle_archive_chat_use_case.dart';
import '../../../domain/usecases/toggle_favorite_chat_use_case.dart';

part 'chats_filter_event.dart';

part 'chats_filter_state.dart';

part 'chats_filter_bloc.freezed.dart';

class ChatsFilterBloc extends Bloc<ChatsFilterEvent, ChatsFilterState> {
  final SearchChatsUseCase _searchChatsUseCase;
  final ToggleArchiveChatUseCase _toggleArchiveChatUseCase;
  final ToggleFavoriteChatUseCase _toggleFavoriteChatUseCase;
  final ListenChatUpdatesUseCase _listenChatUpdatesUseCase;

  ChatsFilterBloc({
    required SearchChatsUseCase searchChatsUseCase,
    required ToggleArchiveChatUseCase toggleArchiveChatUseCase,
    required ToggleFavoriteChatUseCase toggleFavoriteChatUseCase,
    required ListenChatUpdatesUseCase listenChatUpdatesUseCase,
  }) : _searchChatsUseCase = searchChatsUseCase,
       _toggleArchiveChatUseCase = toggleArchiveChatUseCase,
       _listenChatUpdatesUseCase = listenChatUpdatesUseCase,
       _toggleFavoriteChatUseCase = toggleFavoriteChatUseCase,
       super(const ChatsFilterState()) {
    on<_ApplyFilter>(_applyFilter);
    on<_Search>(
      _search,
      transformer: debounceTransformer(
        Duration(
          milliseconds: 500,
        ),
      ),
    );
    on<_ToggleArchived>(_toggleArchived);
    on<_ToggleFavorite>(_toggleFavorite);
    on<_ListenChatsChanges>(_listenChatsChanges);
  }

  void _applyFilter(_ApplyFilter event, emit) async {
    try {
      emit(
        state.copyWith(
          filter: event.filter,
          status: ChatsFilterStatus.searching,
        ),
      );
      final ChatPgState chatsState = await _searchChatsUseCase.call(
        chatState: ChatPgState(),
        query: state.query,
        filter: event.filter,
      );
      emit(
        state.copyWith(
          filter: event.filter,
          chatsState: chatsState,
          status: ChatsFilterStatus.initial,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          errorMessage: e.toString(),
          status: ChatsFilterStatus.failed,
        ),
      );
    }
  }

  void _listenChatsChanges(
    _ListenChatsChanges event,
    Emitter<ChatsFilterState> emit,
  ) async {
    emit.forEach(
      _listenChatUpdatesUseCase.call(),
      onData: (Chat chat) {
        final chats = [
          ...state.chatsState.chats,
        ];
        final index = chats.indexWhere(
          (e) => e.chatId == chat.chatId,
        );
        chats[index] = chat;

        return state.copyWith(
          chatsState: state.chatsState.copyWith(
            chats: chats,
          ),
        );
      },
      onError: (e, _) {
        return state.copyWith(
          errorMessage: e.toString(),
          status: ChatsFilterStatus.failed,
        );
      },
    );
  }

  void _search(_Search event, emit) async {
    try {
      emit(
        state.copyWith(
          query: event.query,
          status: ChatsFilterStatus.searching,
        ),
      );
      final ChatPgState chatState = await _searchChatsUseCase.call(
        chatState: state.chatsState,
        query: event.query,
        filter: state.filter,
      );
      emit(
        state.copyWith(
          query: event.query,
          chatsState: chatState,
          status: ChatsFilterStatus.initial,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          errorMessage: e.toString(),
          status: ChatsFilterStatus.failed,
        ),
      );
    }
  }

  void _toggleArchived(_ToggleArchived event, emit) async {
    try {
      await _toggleArchiveChatUseCase.call(
        chatId: event.chat.chatId,
      );

      final ChatPgState chatState = await _searchChatsUseCase.call(
        chatState: state.chatsState,
        query: state.query,
        filter: state.filter,
      );
      final isArchived = !event.chat.isArchived;

      emit(
        state.copyWith(
          status: isArchived
              ? ChatsFilterStatus.archived
              : ChatsFilterStatus.unArchived,
          chatsState: chatState,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          errorMessage: e.toString(),
          status: ChatsFilterStatus.failed,
        ),
      );
    }
  }

  void _toggleFavorite(_ToggleFavorite event, emit) async {
    try {
      await _toggleFavoriteChatUseCase.call(
        chatId: event.chat.chatId,
      );

      final ChatPgState chatsState = await _searchChatsUseCase.call(
        chatState: ChatPgState(),
        query: state.query,
        filter: state.filter,
      );

      final isFavorite = !event.chat.isFavorite;

      emit(
        state.copyWith(
          status: isFavorite
              ? ChatsFilterStatus.favorite
              : ChatsFilterStatus.unFavorite,
          chatsState: chatsState,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          errorMessage: e.toString(),
          status: ChatsFilterStatus.failed,
        ),
      );
    }
  }
}
