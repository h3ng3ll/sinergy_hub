part of 'reset_password_page_bloc.dart';

enum ResetPasswordPageStatus {
  initial,
  loading,
  failed,
  emailSent,
}

extension ResetPasswordPageStateX on ResetPasswordPageState {
  bool get isEmailSent => status == ResetPasswordPageStatus.emailSent;

  bool get isFailed => status == ResetPasswordPageStatus.failed;
}

@freezed
sealed class ResetPasswordPageState with _$ResetPasswordPageState {
  const factory ResetPasswordPageState({
    @Default(ResetPasswordPageStatus.initial) ResetPasswordPageStatus status,
    @Default('') String errorMessage,
  }) = _ResetPasswordPageState;
}
