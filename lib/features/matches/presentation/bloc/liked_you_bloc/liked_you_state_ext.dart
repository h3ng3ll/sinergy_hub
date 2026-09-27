part of 'liked_you_bloc.dart';

extension LikedYouStateX on LikedYouState {
  List<LikedYouItem> get items => likesState.items;

  LikedYouQuota? get quota => likesState.quota;

  bool get isInitial => status == ELikedYouStatus.initial;

  bool get isLoading => status == ELikedYouStatus.loading;

  bool get isLoadingMore => status == ELikedYouStatus.loadingMore;

  bool get isRefreshing => status == ELikedYouStatus.refreshing;

  bool get isFailed => status == ELikedYouStatus.failed;

  bool get isLoadMoreFailed => status == ELikedYouStatus.loadMoreFailed;

  /// The steady, non-transitional state — mirrors `PeopleDataState`'s reuse
  /// of `initial` as the post-load idle status.
  bool get isReady => status == ELikedYouStatus.initial;

  bool get isEmpty => items.isEmpty;

  bool get hasLocked => items.any((item) => item.isLocked);
}
