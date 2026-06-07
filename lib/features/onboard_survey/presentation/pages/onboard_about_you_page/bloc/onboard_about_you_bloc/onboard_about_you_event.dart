part of 'onboard_about_you_bloc.dart';

@freezed
sealed class OnboardAboutYouEvent with _$OnboardAboutYouEvent {
  const factory OnboardAboutYouEvent.load() = _Load;
}
