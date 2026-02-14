import '../../../auth/domain/repostories/i_auth_repository.dart';
import '../models/onboard_status/onboard_status.dart';
import '../repositories/i_onboard_survey_repository.dart';

class SetCompletionStatusUseCase {
  final IOnboardSurveyRepository _onboardSurveyRepository;
  final IAuthRepository _authRepository;

  SetCompletionStatusUseCase({
    required IOnboardSurveyRepository onboardSurveyRepository,
    required IAuthRepository authRepository,
  }) : _onboardSurveyRepository = onboardSurveyRepository,
        _authRepository = authRepository ;

  Future<void> call({
    required OnboardStatus status,
  }) async {
    final uid = await  _authRepository.requireUserId();
    await _onboardSurveyRepository.setCompletionStatus(
      status: status,
      uid: uid,
    );
  }
}
