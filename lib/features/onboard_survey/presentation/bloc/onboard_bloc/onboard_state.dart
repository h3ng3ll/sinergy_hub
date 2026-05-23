part of 'onboard_bloc.dart';

enum EOnboardStatus {
  initial,
  loading,
  loaded,
  failed,
}

@freezed
sealed class OnboardState with _$OnboardState {
  const OnboardState._();

  const factory OnboardState({
    required OnboardStatus onboardStatus,
    @Default(EOnboardStatus.initial) EOnboardStatus status,
    @Default('') String errorMessage,
  }) = _OnboardState;

  bool get isLoaded => status == EOnboardStatus.loaded;
}
