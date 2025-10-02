part of 'onboard_survey_page_bloc.dart';

@freezed
sealed class OnboardSurveyPageState with _$OnboardSurveyPageState {
  const factory OnboardSurveyPageState({
    @Default(1) int step,
  }) = _OnboardSurveyPageState;
}
