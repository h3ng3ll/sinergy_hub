part of 'liked_you_bloc.dart';

@freezed
class LikedYouEvent with _$LikedYouEvent {
  const factory LikedYouEvent.load() = _Load;

  const factory LikedYouEvent.loadMore() = _LoadMore;

  const factory LikedYouEvent.refresh() = _Refresh;

  const factory LikedYouEvent.watchChanges() = _WatchChanges;
}
