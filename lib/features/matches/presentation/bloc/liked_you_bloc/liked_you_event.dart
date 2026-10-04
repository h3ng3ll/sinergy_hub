part of 'liked_you_bloc.dart';

@freezed
class LikedYouEvent with _$LikedYouEvent {
  const factory LikedYouEvent.loadMore() = _LoadMore;

  const factory LikedYouEvent.refresh() = _Refresh;

  /// Subscribes to the live feed — see `WatchLikedYouUseCase`.
  const factory LikedYouEvent.watch() = _Watch;

  const factory LikedYouEvent.respond({
    required LikedYouItem item,
    required TinderCardStatus status,
  }) = _Respond;
}
