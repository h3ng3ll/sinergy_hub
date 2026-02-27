// part of 'people_bloc.dart';
//
// enum PeopleStatus {
//   initial,
//   loading,
//   failed,
// }
//
// extension PeopleStateX on PeopleState {
//   get isLoading => status == PeopleStatus.loading;
//
//   get isFailed => status == PeopleStatus.failed;
// }
//
// @freezed
// sealed class PeopleState with _$PeopleState {
//   const factory PeopleState({
//     @Default({}) Map<String, UserData> users,
//     @Default(PeopleStatus.initial) PeopleStatus status,
//     @Default('') String errorMessage,
//   }) = _PeopleState;
// }
