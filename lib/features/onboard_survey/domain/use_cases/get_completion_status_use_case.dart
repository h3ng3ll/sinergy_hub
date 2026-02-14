import '../../../auth/domain/repostories/i_auth_repository.dart';
import '../models/onboard_status/onboard_status.dart';
import '../repositories/i_onboard_survey_repository.dart';

class GetCompletionStatusUseCase {
  final IOnboardSurveyRepository _onboardSurveyRepository;
  final IAuthRepository _authRepository;

  GetCompletionStatusUseCase({
    required IOnboardSurveyRepository onboardSurveyRepository,
    required IAuthRepository authRepository,
  }) : _onboardSurveyRepository = onboardSurveyRepository,
        _authRepository = authRepository ;

  Future<OnboardStatus?> call() async {
    final uid = await  _authRepository.requireUserId();
    final status = await _onboardSurveyRepository.getCompletionStatus(
      uid: uid,
    );
    return status;
  }
}
