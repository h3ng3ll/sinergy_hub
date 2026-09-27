part of 'liked_you_bloc.dart';

enum ELikedYouStatus {
  initial,
  loading,
  loadingMore,
  refreshing,
  failed,
  loadMoreFailed,
}

@freezed
sealed class LikedYouState with _$LikedYouState {
  const factory LikedYouState({
    @Default(LikedYouPgState()) LikedYouPgState likesState,
    @Default(ELikedYouStatus.loading) ELikedYouStatus status,
    @Default('') String errorMessage,
  }) = _LikedYouState;
}
