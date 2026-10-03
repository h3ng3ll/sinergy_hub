import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/utils/extensions/chats_filter_state_ext.dart';
import '../../../../user/domain/models/user_data/user_data.dart';
import '../../../../user/domain/usecases/get_current_user_data_use_case.dart';
import '../../../../user/domain/usecases/listen_user_data_use_case.dart';
import '../../../domain/models/chat/chat.dart';
import '../../../domain/models/chat_pg_state.dart/chat_pg_state.dart';
import '../../../domain/models/e_chat_filter.dart';
import '../../../domain/usecases/filter_chats_use_case.dart';
import '../../../domain/usecases/toggle_archive_chat_use_case.dart';
import '../../../domain/usecases/toggle_favorite_chat_use_case.dart';
import '../../../domain/usecases/watch_chats_use_case.dart';

part 'chats_filter_event.dart';

part 'chats_filter_state.dart';

part 'chats_filter_bloc.freezed.dart';

class ChatsFilterBloc extends Bloc<ChatsFilterEvent, ChatsFilterState> {
  final WatchChatsUseCase _watchChatsUseCase;
  final FilterChatsUseCase _filterChatsUseCase;
  final ToggleArchiveChatUseCase _toggleArchiveChatUseCase;
  final ToggleFavoriteChatUseCase _toggleFavoriteChatUseCase;
  final GetCurrentUserDataUseCase _getCurrentUserDataUseCase;
  final ListenUserDataUseCase _listenUserDataUseCase;

  ChatsFilterBloc({
    required WatchChatsUseCase watchChatsUseCase,
    required FilterChatsUseCase filterChatsUseCase,
    required ToggleArchiveChatUseCase toggleArchiveChatUseCase,
    required ToggleFavoriteChatUseCase toggleFavoriteChatUseCase,
    required GetCurrentUserDataUseCase getCurrentUserDataUseCase,
    required ListenUserDataUseCase listenUserDataUseCase,
  }) : _watchChatsUseCase = watchChatsUseCase,
       _filterChatsUseCase = filterChatsUseCase,
       _toggleArchiveChatUseCase = toggleArchiveChatUseCase,
       _toggleFavoriteChatUseCase = toggleFavoriteChatUseCase,
       _getCurrentUserDataUseCase = getCurrentUserDataUseCase,
       _listenUserDataUseCase = listenUserDataUseCase,
       super(const ChatsFilterState()) {
    on<_ApplyFilter>(_applyFilter);
    on<_Search>(_search);
    on<_ToggleArchived>(_toggleArchived);
    on<_ToggleFavorite>(_toggleFavorite);
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

  /// The visible list for the current filter and query, computed locally
  /// from the cached chats — no backend request.
  ChatPgState _visible({
    required List<Chat> allChats,
    EChatFilter? filter,
    String? query,
    String? uid,
  }) => ChatPgState(
    hasMore: false,
    chats: _filterChatsUseCase.call(
      chats: allChats,
      uid: uid ?? state.uid,
      filter: filter ?? state.filter,
      query: query ?? state.query,
    ),
  );

  void _applyFilter(
    _ApplyFilter event,
    Emitter<ChatsFilterState> emit,
  ) {
    emit(
      state.copyWith(
        filter: event.filter,
        chatsState: _visible(
          allChats: state.allChats,
          filter: event.filter,
        ),
      ),
    );
    add(const ChatsFilterEvent.syncPeerSubs());
  }

  void _search(
    _Search event,
    Emitter<ChatsFilterState> emit,
  ) {
    emit(
      state.copyWith(
        query: event.query,
        chatsState: _visible(
          allChats: state.allChats,
          query: event.query,
        ),
      ),
    );
    add(const ChatsFilterEvent.syncPeerSubs());
  }

  Future<void> _init(
    _Init event,
    Emitter<ChatsFilterState> emit,
  ) async {
    try {
      emit(
        state.copyWith(
          status: ChatsFilterStatus.loading,
        ),
      );
      final user = await _getCurrentUserDataUseCase.call(
        preferCache: true,
      );
      emit(
        state.copyWith(
          uid: user.uid,
        ),
      );

      await emit.forEach(
        _watchChatsUseCase.call(),
        onData: (List<Chat> chats) {
          final next = state.copyWith(
            allChats: chats,
            chatsState: _visible(allChats: chats),
            status: _resolveToggleStatus(chats) ??
                (state.isLoading ? ChatsFilterStatus.initial : state.status),
          );
          add(const ChatsFilterEvent.syncPeerSubs());
          return next;
        },
        onError: (e, _) => state.copyWith(
          errorMessage: e.toString(),
          status: ChatsFilterStatus.failed,
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

  /// Archive/favorite feedback for the first chat whose flag flipped.
  ChatsFilterStatus? _resolveToggleStatus(List<Chat> chats) {
    final previous = {
      for (final chat in state.allChats) chat.chatId: chat,
    };
    for (final chat in chats) {
      final old = previous[chat.chatId];
      if (old == null) continue;
      final status = state.resolveStatus(old, chat, state.uid);
      if (status != null) return status;
    }
    return null;
  }

  Future<void> _toggleArchived(
    _ToggleArchived event,
    Emitter<ChatsFilterState> emit,
  ) async {
    try {
      /// The live listener writes the change into the cache, which refreshes
      /// the list — no re-query needed.
      await _toggleArchiveChatUseCase.call(
        chatId: event.chat.chatId,
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

  Future<void> _toggleFavorite(
    _ToggleFavorite event,
    Emitter<ChatsFilterState> emit,
  ) async {
    try {
      await _toggleFavoriteChatUseCase.call(
        chatId: event.chat.chatId,
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

  @override
  Future<void> close() async {
    for (final sub in state.peerSubs.values) {
      await sub.cancel();
    }
    return super.close();
  }
}
