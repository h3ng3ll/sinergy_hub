import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../user/domain/models/users_data_pg_state/users_data_pg_state.dart';
import '../../../domain/models/e_people_data_status.dart';
import '../../../../user/domain/models/user_data/user_data.dart';
import '../../../domain/models/matches_filter/matches_filter.dart';
import '../../../domain/usecases/get_cached_discovery_deck_use_case.dart';
import '../../../domain/usecases/look_for_matches_use_case.dart';
import '../../../domain/usecases/remove_from_discovery_deck_use_case.dart';
import '../../../domain/usecases/save_discovery_deck_use_case.dart';

part 'people_data_event.dart';

part 'people_data_state.dart';

part 'people_data_bloc.freezed.dart';

class PeopleDataBloc extends Bloc<PeopleDataEvent, PeopleDataState> {
  final LookForMatchesUseCase _lookForMatchesUseCase;
  final GetCachedDiscoveryDeckUseCase _getCachedDiscoveryDeckUseCase;
  final SaveDiscoveryDeckUseCase _saveDiscoveryDeckUseCase;
  final RemoveFromDiscoveryDeckUseCase _removeFromDiscoveryDeckUseCase;

  PeopleDataBloc({
    required LookForMatchesUseCase lookForMatchesUseCase,
    required this._getCachedDiscoveryDeckUseCase,
    required this._saveDiscoveryDeckUseCase,
    required this._removeFromDiscoveryDeckUseCase,
  }) : _lookForMatchesUseCase = lookForMatchesUseCase,
       super(const PeopleDataState()) {
    on<_LoadPeoples>(_loadPeoples);
    on<_LoadMorePeoples>(
      _loadMorePeoples,
      transformer: droppable(),
    );
    on<_ApplyFilter>(_applyFilter);
    on<_RemoveVisible>(
      _removeVisible,
      transformer: droppable(),
    );
    on<_RestoreVisible>(_restoreVisible);
    on<_UpdateViewedPeoples>(_updateViewedPeoples);
    on<_RemoveFilter>(
      _removeFilter,
      transformer: droppable(),
    );
  }

  Future<void> _updateViewedPeoples(
    _UpdateViewedPeoples event,
    Emitter<PeopleDataState> emit,
  ) async {
    final uids = event.uids;
    emit(
      state.copyWith(
        viewedUids: uids,
        status: EPeopleDataStatus.initial,
      ),
    );
    if (!state.initialized) {
      add(
        PeopleDataEvent.loadPeoples(),
      );
    }
  }

  Future<void> _loadPeoples(
    _LoadPeoples event,
    Emitter<PeopleDataState> emit,
  ) => _loadDeck(state.filter, emit);

  /// Cache-first deck for [filter]: a cached, not-yet-swiped deck is shown
  /// with no backend request; otherwise the deck is fetched and cached.
  Future<void> _loadDeck(
    MatchesFilter filter,
    Emitter<PeopleDataState> emit,
  ) async {
    try {
      emit(
        state.copyWith(
          status: EPeopleDataStatus.loading,
        ),
      );

      final cached = await _readCachedDeck(filter);
      if (cached != null) {
        emit(
          state.copyWith(
            initialized: true,
            status: EPeopleDataStatus.initial,
            filter: filter,
            usersState: cached,
          ),
        );
        return;
      }

      final UserDataPgState usersState = await _lookForMatchesUseCase.call(
        userDataState: UserDataPgState(),
        filter: filter,
      );
      emit(
        state.copyWith(
          initialized: true,
          status: EPeopleDataStatus.initial,
          filter: filter,
          usersState: usersState,
        ),
      );
      await _persistDeck();
    } catch (e) {
      emit(
        state.copyWith(
          initialized: true,
          status: EPeopleDataStatus.failed,
          errorMessage: e.toString(),
        ),
      );
      rethrow;
    }
  }

  /// A broken cache read only costs the instant start — fall back to a fetch.
  Future<UserDataPgState?> _readCachedDeck(MatchesFilter filter) async {
    try {
      return await _getCachedDiscoveryDeckUseCase.call(filter: filter);
    } catch (_) {
      return null;
    }
  }

  /// Mirrors the current deck into the cache under the current filter. A
  /// failed write only loses the instant start of the next open, so it never
  /// fails the deck itself.
  Future<void> _persistDeck() async {
    try {
      await _saveDiscoveryDeckUseCase.call(
        filter: state.filter,
        deck: state.usersState,
      );
    } catch (_) {}
  }

  Future<void> _loadMorePeoples(
    _LoadMorePeoples event,
    Emitter<PeopleDataState> emit,
  ) async {
    try {
      if (!state.usersState.hasMore || state.isLoadingMore) return;
      emit(
        state.copyWith(
          status: EPeopleDataStatus.loadingMore,
        ),
      );
      final UserDataPgState usersState = await _lookForMatchesUseCase.call(
        userDataState: state.usersState,
        filter: state.filter,
      );

      /// Merge fetched items with whatever is currently visible
      /// (a concurrent restoreVisible may have re-inserted a user
      /// while this fetch was in flight). De-duplicate by uid.
      final currentItems = state.usersState.items;
      final fetchedItems = usersState.items;
      final seenUids = <String>{};
      final mergedItems = <UserData>[
        for (final u in fetchedItems)
          if (seenUids.add(u.uid)) u,
        for (final u in currentItems)
          if (seenUids.add(u.uid)) u,
      ];
      emit(
        state.copyWith(
          initialized: true,
          status: EPeopleDataStatus.initial,
          usersState: usersState.copyWith(items: mergedItems),
        ),
      );
      await _persistDeck();
    } catch (e) {
      emit(
        state.copyWith(
          initialized: true,
          status: EPeopleDataStatus.failed,
          errorMessage: e.toString(),
        ),
      );
      rethrow;
    }
  }

  Future<void> _applyFilter(
    _ApplyFilter event,
    Emitter<PeopleDataState> emit,
  ) async {
    if (event.filter == state.filter) return;
    await _loadDeck(event.filter, emit);
  }

  Future<void> _removeFilter(
    _RemoveFilter event,
    Emitter<PeopleDataState> emit,
  ) => _loadDeck(MatchesFilter(), emit);

  Future<void> _restoreVisible(
    _RestoreVisible event,
    Emitter<PeopleDataState> emit,
  ) async {
    final items = [
      ...state.usersState.items,
    ];
    final alreadyPresent = items.any(
      (u) => u.uid == event.user.uid,
    );
    if (alreadyPresent) return;
    items.add(event.user);
    emit(
      state.copyWith(
        status: EPeopleDataStatus.initial,
        usersState: state.usersState.copyWith(
          items: items,
        ),
      ),
    );
    await _persistDeck();
  }

  Future<void> _removeVisible(_RemoveVisible event, emit) async {
    try {
      emit(
        state.copyWith(
          status: EPeopleDataStatus.loading,
        ),
      );

      if (state.usersState.items.length <= 5 && state.usersState.hasMore) {
        add(
          PeopleDataEvent.loadMorePeoples(),
        );
      }
      final items = [
        ...state.usersState.items,
      ];

      final swiped = items.isNotEmpty ? items.removeLast() : null;
      emit(
        state.copyWith(
          status: EPeopleDataStatus.initial,
          usersState: state.usersState.copyWith(
            items: items,
          ),
        ),
      );
      await _persistDeck();
      if (swiped != null) await _forgetSwiped(swiped.uid);
    } catch (e) {
      emit(
        state.copyWith(
          status: EPeopleDataStatus.failed,
          errorMessage: e.toString(),
        ),
      );
      rethrow;
    }
  }

  /// A swiped user must never come back — under this or any other filter.
  Future<void> _forgetSwiped(String userUid) async {
    try {
      await _removeFromDiscoveryDeckUseCase.call(userUid: userUid);
    } catch (_) {}
  }
}
