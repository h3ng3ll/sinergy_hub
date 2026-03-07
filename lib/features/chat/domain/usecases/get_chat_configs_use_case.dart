import '../../../auth/domain/repostories/i_auth_repository.dart';
import '../models/chat_config/chat_config.dart';
import '../repositories/i_chat_config_repository.dart';

class GetChatConfigsUseCase {
  final IChatConfigRepository _chatConfigRepository;
  final IAuthRepository _authRepository;

  GetChatConfigsUseCase({
    required IChatConfigRepository chatConfigRepository,
    required IAuthRepository authRepository,
  })  : _chatConfigRepository = chatConfigRepository,
        _authRepository = authRepository;

  Future<List<ChatConfig>> call() async {
    final uid = await _authRepository.requireUserId();
    return await _chatConfigRepository.getConfigs(
      uid: uid,
    );
  }
}