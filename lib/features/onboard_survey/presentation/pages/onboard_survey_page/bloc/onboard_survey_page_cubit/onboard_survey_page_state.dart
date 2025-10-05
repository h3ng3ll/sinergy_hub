part of 'onboard_survey_page_cubit.dart';

enum OnboardSurveyPageStatus {
  initial,
  loading,
  failed,
}

@freezed
sealed class OnboardSurveyPageState with _$OnboardSurveyPageState {
  const factory OnboardSurveyPageState({
    @Default(1) int step,
    @Default(OnboardSurveyPageStatus.loading) OnboardSurveyPageStatus status,
  }) = _OnboardSurveyPageState;
}
