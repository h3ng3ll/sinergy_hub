import '../../../auth/domain/repostories/i_auth_repository.dart';
import '../models/chat_config/chat_config.dart';
import '../repositories/i_chat_repository.dart';

class GetChatConfigUseCase {
  final IChatRepository _chatRepository;
  final IAuthRepository _authRepository;

  GetChatConfigUseCase({
    required IChatRepository chatRepository,
    required IAuthRepository authRepository,
  }) : _chatRepository = chatRepository,
       _authRepository = authRepository;

  Future<ChatConfig> call(
    String chatId,
  ) async {
    final uid = await _authRepository.requireUserId();
    return await _chatRepository.getConfig(
      chatId: chatId,
      uid: uid,
    );
  }
}
