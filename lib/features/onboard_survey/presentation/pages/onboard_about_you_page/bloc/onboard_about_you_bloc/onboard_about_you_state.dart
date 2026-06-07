part of 'onboard_about_you_bloc.dart';

enum EOnboardAboutYouStatus {
  initial,
  loading,
  ready,
  failed,
}

@freezed
sealed class OnboardAboutYouState with _$OnboardAboutYouState {
  const OnboardAboutYouState._();

  const factory OnboardAboutYouState({
    @Default(EOnboardAboutYouStatus.initial) EOnboardAboutYouStatus status,
    @Default('') String firstName,
    @Default('') String lastName,
    String? email,
    @Default('') String errorMessage,
  }) = _OnboardAboutYouState;
}
