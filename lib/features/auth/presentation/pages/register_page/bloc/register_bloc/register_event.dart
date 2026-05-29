part of 'register_bloc.dart';

@freezed
sealed class RegisterEvent with _$RegisterEvent {
  const factory RegisterEvent.register({
    required String email,
    required String password,
  }) = _Register;

  const factory RegisterEvent.checkVerification() = _CheckVerification;

  const factory RegisterEvent.tickCountdown() = _TickCountdown;
}
