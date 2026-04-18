part of 'login_bloc.dart';



enum LoginStatus {
  initial,
  loading,
  failed,
  authorized,
}

extension LoginStatusX on LoginState {
  bool get isAuthorized => status == LoginStatus.authorized;
  bool get isLoading=> status == LoginStatus.loading;
}
@freezed
sealed class LoginState with _$LoginState {
  const factory LoginState({

    @Default(LoginStatus.initial) LoginStatus status,
    @Default('') String errorMessage,
  }) = _LoginState;
}
