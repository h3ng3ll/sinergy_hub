import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/exception/liked_you_failures.dart';
import '../../../domain/models/liked_you/liked_you_item.dart';
import '../../../domain/models/liked_you/liked_you_quota.dart';
import '../../../domain/models/liked_you_pg_state/liked_you_pg_state.dart';
import '../../../domain/usecases/get_liked_you_use_case.dart';
import '../../../domain/usecases/watch_liked_you_changes_use_case.dart';

part 'liked_you_event.dart';

part 'liked_you_state.dart';

part 'liked_you_state_ext.dart';

part 'liked_you_bloc.freezed.dart';

class LikedYouBloc extends Bloc<LikedYouEvent, LikedYouState> {
  final GetLikedYouUseCase _getLikedYouUseCase;
  final WatchLikedYouChangesUseCase _watchLikedYouChangesUseCase;

  LikedYouBloc({
    required this._getLikedYouUseCase,
    required this._watchLikedYouChangesUseCase,
  }) : super(const LikedYouState()) {
    on<_Load>(_load);
    on<_LoadMore>(
      _loadMore,
      transformer: droppable(),
    );
    on<_Refresh>(
      _refresh,
      transformer: droppable(),
    );
    on<_WatchChanges>(
      _watchChanges,
      transformer: restartable(),
    );
  }

  Future<void> _load(_Load event, Emitter<LikedYouState> emit) async {
    emit(
      state.copyWith(
        status: ELikedYouStatus.loading,
      ),
    );

    final result = await _getLikedYouUseCase.call(
      state: const LikedYouPgState(),
    );

    result.fold(
      (likesState) => emit(
        state.copyWith(
          status: ELikedYouStatus.initial,
          likesState: likesState,
          errorMessage: '',
        ),
      ),
      (failure) => emit(
        state.copyWith(
          status: ELikedYouStatus.failed,
          errorMessage: failure.message,
        ),
      ),
    );
  }

  Future<void> _refresh(_Refresh event, Emitter<LikedYouState> emit) =>
      _reloadFirstPage(emit);

  /// Re-fetches the first page whenever the backend's `likedYouMeta/{uid}`
  /// signal changes (a new like arrived, or one left the feed). The feed data
  /// itself still comes from the gated `getLikedYou` callable.
  Future<void> _watchChanges(
    _WatchChanges event,
    Emitter<LikedYouState> emit,
  ) async {
    try {
      await for (final _ in _watchLikedYouChangesUseCase.call()) {
        if (emit.isDone) return;
        await _reloadFirstPage(emit);
      }
    } catch (_) {
      // A broken signal stream only loses live updates; pull-to-refresh
      // and Retry still work, so the feed state is left untouched.
    }
  }

  Future<void> _reloadFirstPage(Emitter<LikedYouState> emit) async {
    emit(
      state.copyWith(
        status: ELikedYouStatus.refreshing,
      ),
    );

    final result = await _getLikedYouUseCase.call(
      state: const LikedYouPgState(),
    );

    result.fold(
      (likesState) => emit(
        state.copyWith(
          status: ELikedYouStatus.initial,
          likesState: likesState,
          errorMessage: '',
        ),
      ),
      (failure) => emit(
        state.copyWith(
          status: ELikedYouStatus.failed,
          errorMessage: failure.message,
        ),
      ),
    );
  }

  Future<void> _loadMore(_LoadMore event, Emitter<LikedYouState> emit) async {
    if (!state.likesState.hasMore || state.isLoadingMore) return;
    emit(
      state.copyWith(
        status: ELikedYouStatus.loadingMore,
      ),
    );

    var result = await _getLikedYouUseCase.call(state: state.likesState);

    // An invalid/expired cursor (`invalid-argument`) can't be retried
    // as-is: reset to the first page once. If that reload also fails, the
    // branch below falls through to the normal full-page failed state.
    final isInvalidCursor = result.fold(
      (_) => false,
      (failure) => failure is LikedYouInvalidCursorFailure,
    );
    if (isInvalidCursor) {
      result = await _getLikedYouUseCase.call(
        state: LikedYouPgState(pageSize: state.likesState.pageSize),
      );
    }

    result.fold(
      (likesState) {
        final mergedItems = isInvalidCursor
            ? likesState.items
            : _mergeByLikeId(
                current: state.likesState.items,
                fetched: likesState.items,
              );
        emit(
          state.copyWith(
            status: ELikedYouStatus.initial,
            likesState: likesState.copyWith(items: mergedItems),
          ),
        );
      },
      (failure) => emit(
        state.copyWith(
          status: isInvalidCursor
              ? ELikedYouStatus.failed
              : ELikedYouStatus.loadMoreFailed,
          errorMessage: failure.message,
          likesState: isInvalidCursor
              ? state.likesState.copyWith(items: const [])
              : state.likesState,
        ),
      ),
    );
  }

  /// De-duplicates by `likeId` — a concurrent `refresh` may have already
  /// re-fetched an item this page also returns.
  List<LikedYouItem> _mergeByLikeId({
    required List<LikedYouItem> current,
    required List<LikedYouItem> fetched,
  }) {
    final seenIds = <String>{};
    return <LikedYouItem>[
      for (final item in current)
        if (seenIds.add(item.likeId)) item,
      for (final item in fetched)
        if (seenIds.add(item.likeId)) item,
    ];
  }
}
