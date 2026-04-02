import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/utils/extensions/bloc_ext.dart';
import '../../../../user/domain/models/user_data/user_data.dart';
import '../../../../user/domain/usecases/get_current_user_data_use_case.dart';
import '../../../../user/domain/usecases/get_user_data_use_case.dart';
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
  final GetCurrentUserDataUseCase _getCurrentUserDataUseCase;
  final GetUserDataUseCase _getUserDataUseCase;

  ChatsFilterBloc({
    required SearchChatsUseCase searchChatsUseCase,
    required ToggleArchiveChatUseCase toggleArchiveChatUseCase,
    required ToggleFavoriteChatUseCase toggleFavoriteChatUseCase,
    required ListenChatUpdatesUseCase listenChatUpdatesUseCase,
    required GetCurrentUserDataUseCase getCurrentUserDataUseCase,
    required GetUserDataUseCase getUserDataUseCase,
  }) : _searchChatsUseCase = searchChatsUseCase,
       _toggleArchiveChatUseCase = toggleArchiveChatUseCase,
       _listenChatUpdatesUseCase = listenChatUpdatesUseCase,
       _toggleFavoriteChatUseCase = toggleFavoriteChatUseCase,
       _getCurrentUserDataUseCase = getCurrentUserDataUseCase,
       _getUserDataUseCase = getUserDataUseCase,
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
    on<_Init>(_init);
  }

  Future<Map<String, bool>> _fillOnline(
    List<Chat> chats,
    Map<String, bool> online,
  ) async {
    final lastMessage = chats.map(
      (Chat e) => e.lastMessageSentBy,
    );
    Map<String, bool> onlineStatuses = {...online};

    for (final uid in lastMessage) {
      if (online.containsKey(uid)) continue;
      final UserData? user = await _getUserDataUseCase.call(
        id: uid,
      );
      onlineStatuses.addEntries(
        {
          MapEntry(
            uid,
            user?.isOnline ?? false,
          ),
        },
      );
    }
    return onlineStatuses;
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
      final online = await _fillOnline(
        chatsState.chats,
        state.onlineStatuses,
      );
      emit(
        state.copyWith(
          filter: event.filter,
          onlineStatuses: online,
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

  void _init(_Init event, emit) async {
    try {
      emit(
        state.copyWith(
          status: ChatsFilterStatus.loading,
        ),
      );
      final user = await _getCurrentUserDataUseCase.call();

      add(
        ChatsFilterEvent.search(
          query: '',
        ),
      );
      add(
        ChatsFilterEvent.listenChatsChanges(),
      );

      emit(
        state.copyWith(
          uid: user.uid,
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

        /// No found
        if (index == -1) {
          return state;
        }

        final uid = state.uid;

        final status = state.resolveStatus(
          chats[index],
          chat,
          uid,
        );

        chats[index] = chat;
        return state.copyWith(
          status: status ?? state.status,
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

      final online = await _fillOnline(
        chatState.chats,
        state.onlineStatuses,
      );

      emit(
        state.copyWith(
          query: event.query,
          chatsState: chatState,
          onlineStatuses: online,
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

      emit(
        state.copyWith(
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

      emit(
        state.copyWith(
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
