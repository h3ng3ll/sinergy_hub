part of 'register_bloc.dart';


enum RegisterStatus {
  initial,
  loading,
  failed,
  pendingVerification,
  registered,
}

extension RegisterStateX on RegisterState {
  bool get isRegistered => status == RegisterStatus.registered;
  bool get isFailed => status == RegisterStatus.failed;
  bool get isPendingVerification => status == RegisterStatus.pendingVerification;
  bool get isCounting => resendCountdown > 0;
  bool get canResend => resendCountdown == 0;
}
@freezed
sealed class RegisterState with _$RegisterState {
  const factory RegisterState({

    @Default(RegisterStatus.initial) RegisterStatus status,
    @Default('') String errorMessage,
    @Default(0) int resendCountdown,
  }) = _RegisterState;
}
