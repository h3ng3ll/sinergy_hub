part of 'reset_password_page_bloc.dart';

@freezed
sealed class ResetPasswordPageEvent with _$ResetPasswordPageEvent {
  const factory ResetPasswordPageEvent.reset({
    required String email,
  }) = _Reset;
}
