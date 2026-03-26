part of 'login_bloc.dart';



enum LoginStatus {
  initial,
  loading,
  failed,
}
@freezed
sealed class LoginState with _$LoginState {
  const factory LoginState({

    @Default(LoginStatus.initial) LoginStatus status,
    @Default('') String errorMessage,
  }) = _LoginState;
}
