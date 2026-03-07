import '../../../auth/domain/repostories/i_auth_repository.dart';
import '../models/chat_config/chat_config.dart';
import '../repositories/i_chat_config_repository.dart';

class UpdateChatConfigUseCase {
  final IChatConfigRepository _chatConfigRepository;
  final IAuthRepository _authRepository;

  UpdateChatConfigUseCase({
    required IChatConfigRepository chatConfigRepository,
    required IAuthRepository authRepository,
  })  : _chatConfigRepository = chatConfigRepository,
        _authRepository = authRepository;

  Future<void> call({
    required String chatId,
    bool? archived,
    bool? favorite,
  }) async {
    final uid = await _authRepository.requireUserId();

    // Get existing config or create default
    final existingConfig = await _chatConfigRepository.getConfig(
      uid: uid,
      chatId: chatId,
    );

    final updatedConfig = ChatConfig(
      chatId: chatId,
      archived: archived ?? existingConfig?.archived ?? false,
      favorite: favorite ?? existingConfig?.favorite ?? false,
    );

    await _chatConfigRepository.updateConfig(
      uid: uid,
      config: updatedConfig,
    );
  }
}