import '../../../chat/domain/services/i_presence_service.dart';
import '../repostories/i_auth_repository.dart';

class LogoutUseCase {
  final IAuthRepository _authRepository;
  final IPresenceService _presenceService;

  LogoutUseCase({
    required IAuthRepository authRepository,
    required IPresenceService presenceService,
  }) : _authRepository = authRepository,
       _presenceService = presenceService;

  Future<void> call() async {
    await _presenceService.setOffline();
    await _authRepository.signOut();
  }
}
