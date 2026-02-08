part of 'register_bloc.dart';


enum RegisterStatus {
  initial,
  loading,
  authorized,
  failed,
}

@freezed
sealed class RegisterState with _$RegisterState {
  const factory RegisterState({

    @Default(RegisterStatus.initial) RegisterStatus status,
    @Default('') String errorMessage,
  }) = _RegisterState;
}
