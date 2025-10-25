part of 'people_data_bloc.dart';



@freezed
sealed class PeopleDataState with _$PeopleDataState {
  const factory PeopleDataState({
    @Default([]) List<UserData> users ,
    @Default([]) List<String> viewedUids ,
    @Default(false) bool initialized,
    @Default(EPeopleDataStatus.loading) EPeopleDataStatus status,
    @Default('') String errorMessage,
  }) = _PeopleDataState;
}
