import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'onboard_survey_page_event.dart';

part 'onboard_survey_page_state.dart';

part 'onboard_survey_page_bloc.freezed.dart';

class OnboardSurveyPageBloc
    extends Bloc<OnboardSurveyPageEvent, OnboardSurveyPageState> {
  OnboardSurveyPageBloc() : super(const OnboardSurveyPageState()) {
    on<_GoTo>(goTo);
  }

  void goTo(event, emit) {
    final page = event.page;
    emit(
      state.copyWith(
        step: page + 1,
      ),
    );
  }
}
