part of 'onboard_survey_page_bloc.dart';

@freezed
sealed class OnboardSurveyPageEvent with _$OnboardSurveyPageEvent {
  const factory OnboardSurveyPageEvent.goTo({
    required int page,
  }) = _GoTo;
}
