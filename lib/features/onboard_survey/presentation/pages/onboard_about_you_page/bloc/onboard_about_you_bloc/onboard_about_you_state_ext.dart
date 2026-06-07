part of 'onboard_about_you_bloc.dart';

extension OnboardAboutYouStateX on OnboardAboutYouState {
  bool get isInitial => status == EOnboardAboutYouStatus.initial;

  bool get isLoading => status == EOnboardAboutYouStatus.loading;

  bool get isReady => status == EOnboardAboutYouStatus.ready;

  bool get isFailed => status == EOnboardAboutYouStatus.failed;
}
