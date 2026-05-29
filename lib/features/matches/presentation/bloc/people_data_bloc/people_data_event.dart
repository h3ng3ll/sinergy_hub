part of 'people_data_bloc.dart';

@freezed
class PeopleDataEvent with _$PeopleDataEvent {
  const factory PeopleDataEvent.loadPeoples() = _LoadPeoples;
  const factory PeopleDataEvent.loadMorePeoples() = _LoadMorePeoples;

  const factory PeopleDataEvent.applyFilter({
    required MatchesFilter filter,
  }) = _ApplyFilter;

  const factory PeopleDataEvent.removeFilter() = _RemoveFilter;

  const factory PeopleDataEvent.removeVisible() = _RemoveVisible;

  const factory PeopleDataEvent.restoreVisible({
    required UserData user,
  }) = _RestoreVisible;

  const factory PeopleDataEvent.updateViewedPeoples({
    required List<String> uids,
  }) = _UpdateViewedPeoples;
}
