part of 'onboard_bloc.dart';

@freezed
sealed class OnboardEvent with _$OnboardEvent {
  const factory OnboardEvent.update({
    bool? toldAboutYourself,
    bool? completeSpecialization,
  }) = _Update;
 const factory OnboardEvent.load() = _Load;

  const factory OnboardEvent.reset() = _Reset;
}
