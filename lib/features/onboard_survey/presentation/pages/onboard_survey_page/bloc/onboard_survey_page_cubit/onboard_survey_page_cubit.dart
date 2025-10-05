import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../auth/domain/repostories/i_auth_repository.dart';
import '../../../../../doman/models/user_profiler/user_profiler.dart';
import '../../../../../doman/repositories/i_onboard_survey_repository.dart';

part 'onboard_survey_page_state.dart';

part 'onboard_survey_page_cubit.freezed.dart';

class OnboardSurveyPageCubit extends Cubit<OnboardSurveyPageState> {
  final IOnboardSurveyRepository _onboardSurveyRepository;
  final IAuthRepository _authRepository;

  OnboardSurveyPageCubit({
    required IOnboardSurveyRepository onboardSurveyRepository,
    required IAuthRepository authRepository,
  }) : _onboardSurveyRepository = onboardSurveyRepository,
       _authRepository = authRepository,
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

  void saveResults({
    required UserProfiler userProfiler,
  }) async {

    try {
      emit(
        state.copyWith(
          status: OnboardSurveyPageStatus.loading,
        ),
      );
      final user = (await _authRepository.getCurrentUser())!;

      await _onboardSurveyRepository.setUserProfileData(
        userProfiler: userProfiler,
        uid: user.uid,
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
      final user = (await _authRepository.getCurrentUser())!;

      final bool isExists  = await _onboardSurveyRepository.isExistsProfilerData(
        uid: user.uid,
      );
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
