import '../../../onboard_survey/domain/use_cases/get_completion_status_use_case.dart';
import '../../domain/services/i_app_mode_service.dart';

class AppModeService implements IAppModeService {
  final GetCompletionStatusUseCase _getCompletionStatusUseCase;

  AppModeService({
    required GetCompletionStatusUseCase getCompletionStatusUseCase,
  }) : _getCompletionStatusUseCase = getCompletionStatusUseCase;

  @override
  Future<bool> isTutorialMatchMode() async {
    /// Todo: Create tutorial later
    // final OnboardStatus? status = await _getCompletionStatusUseCase.call();
    // final hasCompleted = status?.completedMatchTutorial ?? false;
    // return !hasCompleted;
    return false;
  }
}
