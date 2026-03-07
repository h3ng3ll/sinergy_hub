import '../../../auth/domain/repostories/i_auth_repository.dart';
import '../models/chat_config/chat_config.dart';
import '../repositories/i_chat_config_repository.dart';

class GetChatConfigsStreamUseCase {
  final IChatConfigRepository _chatConfigRepository;
  final IAuthRepository _authRepository;

  GetChatConfigsStreamUseCase({
    required IChatConfigRepository chatConfigRepository,
    required IAuthRepository authRepository,
  })  : _chatConfigRepository = chatConfigRepository,
        _authRepository = authRepository;

  Stream<List<ChatConfig>> call() async* {
    final uid = await _authRepository.requireUserId();
    yield* _chatConfigRepository.getConfigsStream(uid);
  }
}