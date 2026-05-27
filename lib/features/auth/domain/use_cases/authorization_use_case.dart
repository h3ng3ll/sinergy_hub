import '../../../chat/domain/services/i_presence_service.dart';

class AuthorizationUseCase {
  final IPresenceService _presenceService;

  AuthorizationUseCase({
    required IPresenceService presenceService,
  }) : _presenceService = presenceService;

  Future<void> call() async {
    await _presenceService.init();
  }
}
