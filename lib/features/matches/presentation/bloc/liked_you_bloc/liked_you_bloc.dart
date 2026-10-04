import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/exception/daily_match_limit_exceeded_exception.dart';
import '../../../domain/exception/liked_you_failures.dart';
import '../../../domain/models/liked_you/liked_you_item.dart';
import '../../../domain/models/liked_you/liked_you_quota.dart';
import '../../../domain/models/liked_you_feed_update/liked_you_feed_update.dart';
import '../../../domain/models/liked_you_pg_state/liked_you_pg_state.dart';
import '../../../domain/usecases/create_user_matches_use_case.dart';
import '../../../domain/usecases/get_liked_you_use_case.dart';
import '../../../domain/usecases/sync_liked_you_use_case.dart';
import '../../../domain/usecases/watch_liked_you_use_case.dart';
import '../tinder_card_cubit/tinder_card_cubit.dart';

part 'liked_you_event.dart';

part 'liked_you_state.dart';

part 'liked_you_state_ext.dart';

part 'liked_you_bloc.freezed.dart';

class LikedYouBloc extends Bloc<LikedYouEvent, LikedYouState> {
  final GetLikedYouUseCase _getLikedYouUseCase;
  final WatchLikedYouUseCase _watchLikedYouUseCase;
  final SyncLikedYouUseCase _syncLikedYouUseCase;
  final CreateUserMatchesUseCase _createUserMatchesUseCase;

  LikedYouBloc({
    required this._getLikedYouUseCase,
    required this._watchLikedYouUseCase,
    required this._syncLikedYouUseCase,
    required this._createUserMatchesUseCase,
  }) : super(const LikedYouState()) {
    on<_LoadMore>(
  _loadMore,
      transformer: droppable(),
    );

    /// Restartable, not droppable: a newer refresh (e.g. after a purchase)
    /// must win over a stale in-flight one answered before the change.
    on<_Refresh>(
      _refresh,
      transformer: restartable(),
    );
    on<_Watch>(
      _watch,
      transformer: restartable(),
    );
    on<_Respond>(_respond);
  }

  /// Like / reject an incoming like through the existing `matchUser`
  /// callable. The card leaves the list optimistically, like the swipe deck's
  /// `removeVisible`, and is restored at its old position if the call fails.
  /// A like-back that completes the pair is picked up by the existing
  /// two-way-match listener, which opens the match screen.
  Future<void> _respond(_Respond event, Emitter<LikedYouState> emit) async {
    final item = event.item;
    final uid = item.uid;
    if (uid == null || state.isResponding(item.likeId)) return;

    final index = state.items.indexWhere((e) => e.likeId == item.likeId);
    if (index == -1) return;

    emit(
      state.copyWith(
        actionStatus: ELikedYouActionStatus.idle,
        respondingIds: {...state.respondingIds, item.likeId},
        likesState: state.likesState.copyWith(
          items: [
            for (final e in state.items)
              if (e.likeId != item.likeId) e,
          ],
        ),
      ),
    );

    final result = await _createUserMatchesUseCase.call(
      status: event.status,
      matchedID: uid,
    );

    final respondingIds = {...state.respondingIds}..remove(item.likeId);

    result.fold(
      (_) => emit(
        state.copyWith(
          respondingIds: respondingIds,
        ),
      ),
      (failure) {
        final items = [...state.items];
        if (!items.any((e) => e.likeId == item.likeId)) {
          items.insert(
            index > items.length ? items.length : index,
            item,
          );
        }
        emit(
          state.copyWith(
            respondingIds: respondingIds,
            likesState: state.likesState.copyWith(items: items),
            errorMessage: failure.message,
            actionStatus: failure is DailyMatchLimitExceededException
                ? ELikedYouActionStatus.limitReached
                : ELikedYouActionStatus.failed,
          ),
        );
      },
    );
  }

  /// Pull-to-refresh: one backend sync. A changed first page reaches the
  /// list through the cache watch; an identical one changes nothing.
  Future<void> _refresh(_Refresh event, Emitter<LikedYouState> emit) async {
    emit(
      state.copyWith(
        status: ELikedYouStatus.refreshing,
      ),
    );

    final result = await _syncLikedYouUseCase.call();

    result.fold(
      (_) => emit(
        state.copyWith(
          status: ELikedYouStatus.initial,
          isSynced: true,
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

  /// Cache-first feed: the cached first page shows right away, and every
  /// subscription / likes change syncs with the backend in the background.
  /// Dispatching it again (Retry) re-attaches the listeners.
  Future<void> _watch(_Watch event, Emitter<LikedYouState> emit) async {
    emit(
      state.copyWith(
        status: ELikedYouStatus.loading,
        isSynced: false,
      ),
    );

    await emit.forEach<LikedYouFeedUpdate>(
      _watchLikedYouUseCase.call(),
      onData: (update) => switch (update) {
        LikedYouFeedPage(:final page) => state.copyWith(
          status: ELikedYouStatus.initial,
          likesState: page,
          errorMessage: '',
        ),
        LikedYouFeedSynced() => state.copyWith(
          /// With nothing cached the first page arrives right after this
          /// event, through the cache watch — keep the spinner until then.
          status: state.isLoading
              ? ELikedYouStatus.loading
              : ELikedYouStatus.initial,
          isSynced: true,
          errorMessage: '',
        ),
        LikedYouFeedFailed(:final failure) => state.copyWith(
          status: ELikedYouStatus.failed,
          errorMessage: failure.message,
        ),
      },
      onError: (error, _) => state.copyWith(
        status: ELikedYouStatus.failed,
        errorMessage: error.toString(),
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
