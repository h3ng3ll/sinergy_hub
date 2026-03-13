part of 'people_data_bloc.dart';

extension PeopleDataStateX on PeopleDataState {
  List<UserData> get users => usersState.items;

  bool get isLoadingMore => status == EPeopleDataStatus.loadingMore;
}

@freezed
sealed class PeopleDataState with _$PeopleDataState {
  const factory PeopleDataState({
    @Default(UserDataPgState()) UserDataPgState usersState,
    @Default(MatchesFilter()) MatchesFilter filter,
    @Default([]) List<String> viewedUids,
    @Default(false) bool initialized,
    @Default(EPeopleDataStatus.loading) EPeopleDataStatus status,
    @Default('') String errorMessage,
  }) = _PeopleDataState;
}
