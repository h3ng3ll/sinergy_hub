part of 'user_bloc.dart';

enum UserStatus {
  loaded,
  loading,
  failed,
  updated,
}

@freezed
sealed class UserState with _$UserState {
  const factory UserState({
    UserData? userData,
    @Default('') String errorMessage,
    @Default(UserStatus.loading) UserStatus status,
  }) = _UserState;
}