import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/utils/extensions/bloc_ext.dart';
import '../../../../user/domain/models/user_data/user_data.dart';
import '../../../../user/domain/usecases/get_current_user_data_use_case.dart';
import '../../../../user/domain/usecases/listen_user_data_use_case.dart';
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
  final ListenUserDataUseCase _listenUserDataUseCase;

  ChatsFilterBloc({
    required SearchChatsUseCase searchChatsUseCase,
    required ToggleArchiveChatUseCase toggleArchiveChatUseCase,
    required ToggleFavoriteChatUseCase toggleFavoriteChatUseCase,
    required ListenChatUpdatesUseCase listenChatUpdatesUseCase,
    required GetCurrentUserDataUseCase getCurrentUserDataUseCase,
    required ListenUserDataUseCase listenUserDataUseCase,
  }) : _searchChatsUseCase = searchChatsUseCase,
       _toggleArchiveChatUseCase = toggleArchiveChatUseCase,
       _listenChatUpdatesUseCase = listenChatUpdatesUseCase,
       _toggleFavoriteChatUseCase = toggleFavoriteChatUseCase,
       _getCurrentUserDataUseCase = getCurrentUserDataUseCase,
       _listenUserDataUseCase = listenUserDataUseCase,
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
    on<_UpdateUserOnline>(_updateUserOnline);
    on<_SyncPeerSubs>(_onSyncPeerSubs);
  }

  void _onSyncPeerSubs(
    _SyncPeerSubs event,
    Emitter<ChatsFilterState> emit,
  ) => _syncPeerSubs(emit);

  Set<String> _peerUidsOf(List<Chat> chats) {
    final currentUid = state.uid;
    final result = <String>{};
    for (final chat in chats) {
      for (final p in chat.participants) {
        if (p.isEmpty || p == currentUid) continue;
        result.add(p);
      }
    }
    return result;
  }

  void _syncPeerSubs(Emitter<ChatsFilterState> emit) {
    final wanted = _peerUidsOf(state.chatsState.chats);
    final current = state.peerSubs;

    final next = <String, StreamSubscription<UserData?>>{};
    for (final entry in current.entries) {
      if (wanted.contains(entry.key)) {
        next[entry.key] = entry.value;
      } else {
        entry.value.cancel();
      }
    }

    var changed = next.length != current.length;
    for (final uid in wanted) {
      if (next.containsKey(uid)) continue;
      next[uid] = _listenUserDataUseCase.call(uid).listen((user) {
        if (user == null) return;
        add(
          ChatsFilterEvent.updateUserOnline(user: user),
        );
      });
      changed = true;
    }

    if (changed) {
      emit(
        state.copyWith(peerSubs: next),
      );
    }
  }

  void _updateUserOnline(
    _UpdateUserOnline event,
    Emitter<ChatsFilterState> emit,
  ) {
    final uid = event.user.uid;
    final bool isOnline = event.user.isOnline == true;
    final current = state.onlineStatuses[uid];
    if (current == isOnline) return;
    final updated = <String, bool>{
      ...state.onlineStatuses,
      uid: isOnline,
    };
    emit(
      state.copyWith(onlineStatuses: updated),
    );
  }

  void _applyFilter(
    _ApplyFilter event,
    Emitter<ChatsFilterState> emit,
  ) async {
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
      add(const ChatsFilterEvent.syncPeerSubs());
    } catch (e) {
      emit(
        state.copyWith(
          errorMessage: e.toString(),
          status: ChatsFilterStatus.failed,
        ),
      );
    }
  }

  void _init(
    _Init event,
    Emitter<ChatsFilterState> emit,
  ) async {
    try {
      emit(
        state.copyWith(
          status: ChatsFilterStatus.loading,
        ),
      );
      final user = await _getCurrentUserDataUseCase.call();

      final ChatPgState chatsState = await _searchChatsUseCase.call(
        chatState: ChatPgState(),
        query: state.query,
      );

      emit(
        state.copyWith(
          uid: user.uid,
          chatsState: chatsState,
          status: ChatsFilterStatus.initial,
        ),
      );
      add(const ChatsFilterEvent.syncPeerSubs());
      add(
        ChatsFilterEvent.listenChatsChanges(),
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
    await emit.forEach(
      _listenChatUpdatesUseCase.call(),
      onData: (Chat chat) {
        final chats = [
          ...state.chatsState.chats,
        ];
        final index = chats.indexWhere(
          (e) => e.chatId == chat.chatId,
        );

        final ChatsFilterState next;

        /// No found . New chat
        if (index == -1) {
          chats.add(
            chat,
          );
          next = state.copyWith(
            chatsState: state.chatsState.copyWith(
              chats: chats,
            ),
          );
        } else {
          final uid = state.uid;

          final status = state.resolveStatus(
            chats[index],
            chat,
            uid,
          );

          chats[index] = chat;
          next = state.copyWith(
            status: status ?? state.status,
            chatsState: state.chatsState.copyWith(
              chats: chats,
            ),
          );
        }
        add(const ChatsFilterEvent.syncPeerSubs());
        return next;
      },
      onError: (e, _) {
        return state.copyWith(
          errorMessage: e.toString(),
          status: ChatsFilterStatus.failed,
        );
      },
    );
  }

  void _search(
    _Search event,
    Emitter<ChatsFilterState> emit,
  ) async {
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
      add(const ChatsFilterEvent.syncPeerSubs());
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
      add(const ChatsFilterEvent.syncPeerSubs());
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
      add(const ChatsFilterEvent.syncPeerSubs());
    } catch (e) {
      emit(
        state.copyWith(
          errorMessage: e.toString(),
          status: ChatsFilterStatus.failed,
        ),
      );
    }
  }

  @override
  Future<void> close() async {
    for (final sub in state.peerSubs.values) {
      await sub.cancel();
    }
    return super.close();
  }
}
