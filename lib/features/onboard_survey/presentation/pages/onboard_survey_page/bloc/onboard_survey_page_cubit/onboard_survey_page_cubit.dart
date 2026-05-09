import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../user/domain/usecases/update_user_profiler_use_case.dart';
import '../../../../../domain/models/user_profiler/user_profiler.dart';
import '../../../../../domain/use_cases/get_completion_status_use_case.dart';

part 'onboard_survey_page_state.dart';

part 'onboard_survey_page_cubit.freezed.dart';

class OnboardSurveyPageCubit extends Cubit<OnboardSurveyPageState> {
  final UpdateUserProfilerUseCase _updateUserProfilerUseCase;
  final GetCompletionStatusUseCase _getCompletionStatusUseCase;

  OnboardSurveyPageCubit({
    required UpdateUserProfilerUseCase updateUserProfilerUseCase,
    required GetCompletionStatusUseCase getCompletionStatusUseCase,
  }) : _getCompletionStatusUseCase = getCompletionStatusUseCase,
       _updateUserProfilerUseCase = updateUserProfilerUseCase,
       super(
         const OnboardSurveyPageState(),
       );

  void goTo({required int page}) {
    emit(
      state.copyWith(
        step: page + 1,
      ),
    );
  }

  void goNext() {
    emit(
      state.copyWith(
        step: state.step + 1,
      ),
    );
  }

  void goPrevious() {
    emit(
      state.copyWith(
        step: state.step - 1,
      ),
    );
  }

  Future<void> saveResults({
    required UserProfiler userProfiler,
  }) async {
    try {
      emit(
        state.copyWith(
          status: OnboardSurveyPageStatus.loading,
        ),
      );
      await _updateUserProfilerUseCase.call(
        userProfiler,
      );

      emit(
        state.copyWith(
          status: OnboardSurveyPageStatus.initial,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: OnboardSurveyPageStatus.failed,
        ),
      );
      rethrow;
    }
  }

  Future<bool> hasSavedResults() async {
    try {
      emit(
        state.copyWith(
          status: OnboardSurveyPageStatus.loading,
        ),
      );
      final res = await _getCompletionStatusUseCase.call();
      final bool isExists = res?.completeSpecialization ?? false;
      emit(
        state.copyWith(
          status: OnboardSurveyPageStatus.initial,
        ),
      );
      return isExists;
    } catch (e) {
      emit(
        state.copyWith(
          status: OnboardSurveyPageStatus.failed,
        ),
      );
      rethrow;
    }
  }
}
