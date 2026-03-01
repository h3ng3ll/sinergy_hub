part of 'user_bloc.dart';

enum UserStatus {
  loaded,
  loading,
  failed,
  updated,
  noData,
}

extension UserStateX on UserState {
  bool get isNoData => status == UserStatus.noData;
}
@freezed
sealed class UserState with _$UserState {
  const factory UserState({
    UserData? userData,
    @Default('') String errorMessage,
    @Default(UserStatus.loading) UserStatus status,
  }) = _UserState;
}