part of 'login_bloc.dart';

@freezed
sealed class LoginEvent with _$LoginEvent {
  const factory LoginEvent.login({
    required String email,
    required String password,
  }) = _Login;

  const factory LoginEvent.checkVerification() = _CheckVerification;

  const factory LoginEvent.resendVerification() = _ResendVerification;

  const factory LoginEvent.tickCountdown() = _TickCountdown;
}
