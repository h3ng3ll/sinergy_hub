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
}
@freezed
sealed class RegisterState with _$RegisterState {
  const factory RegisterState({

    @Default(RegisterStatus.initial) RegisterStatus status,
    @Default('') String errorMessage,
  }) = _RegisterState;
}
