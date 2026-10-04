part of 'liked_you_bloc.dart';

enum ELikedYouStatus {
  initial,
  loading,
  loadingMore,
  refreshing,
  failed,
  loadMoreFailed,
}

/// Outcome of the last like/reject tap. Kept apart from [ELikedYouStatus]
/// so a failed action never swaps the list for the load/failed views.
enum ELikedYouActionStatus {
  idle,
  failed,
  limitReached,
}

@freezed
sealed class LikedYouState with _$LikedYouState {
  const factory LikedYouState({
    @Default(LikedYouPgState()) LikedYouPgState likesState,
    @Default(ELikedYouStatus.loading) ELikedYouStatus status,
    @Default('') String errorMessage,
    @Default(ELikedYouActionStatus.idle) ELikedYouActionStatus actionStatus,
    @Default(<String>{}) Set<String> respondingIds,

    /// `true` once a backend sync confirmed (or replaced) the cached page.
    @Default(false) bool isSynced,
  }) = _LikedYouState;
}
