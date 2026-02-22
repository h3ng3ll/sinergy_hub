part of 'user_update_cubit.dart';


enum UserUpdateStatus {
  initial,
  loading,
  failed,
}

@freezed
sealed class UserUpdateState with _$UserUpdateState {
  const factory UserUpdateState({
    UserData? userData,
    @Default(UserUpdateStatus.initial) UserUpdateStatus status,
    @Default('') String errorMessage,
  }) = _UserUpdateState;
}
