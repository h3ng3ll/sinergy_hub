part of 'people_data_bloc.dart';


enum PeopleDataStatus {
  initial,
  loading,
  failed,
}
@freezed
sealed class PeopleDataState with _$PeopleDataState {
  const factory PeopleDataState({
    @Default([]) List<UserData> users ,
    @Default(PeopleDataStatus.loading) PeopleDataStatus status,
    @Default('') String errorMessage,
  }) = _PeopleDataState;
}
