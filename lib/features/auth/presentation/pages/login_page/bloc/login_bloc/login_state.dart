part of 'login_bloc.dart';

enum LoginStatus {
  initial,
  loading,
  failed,
  pendingVerification,
  authorized,
}

extension LoginStatusX on LoginState {
  bool get isAuthorized => status == LoginStatus.authorized;
  bool get isLoading => status == LoginStatus.loading;
  bool get isFailed => status == LoginStatus.failed;
  bool get isPendingVerification => status == LoginStatus.pendingVerification;
  bool get isCounting => resendCountdown > 0;
  bool get canResend => resendCountdown == 0;
}

@freezed
sealed class LoginState with _$LoginState {
  const factory LoginState({
    @Default(LoginStatus.initial) LoginStatus status,
    @Default('') String errorMessage,
    @Default(0) int resendCountdown,
  }) = _LoginState;
}
