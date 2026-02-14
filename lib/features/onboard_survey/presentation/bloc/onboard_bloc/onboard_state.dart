part of 'onboard_bloc.dart';

enum EOnboardStatus {
  initial,
  loading,
  loaded,
  failed,
}

@freezed
sealed class OnboardState with _$OnboardState {
  const factory OnboardState({
    required OnboardStatus onboardStatus,
    @Default(EOnboardStatus.initial) status,
    @Default('') String errorMessage,
  }) = _OnboardState;
}
