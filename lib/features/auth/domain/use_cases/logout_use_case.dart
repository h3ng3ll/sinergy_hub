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
    // Write offline while still authenticated; after signOut() the user is
    // null and the presence service can no longer resolve the uid.
    await _presenceService.setOffline();
    await _authRepository.signOut();
  }
}
