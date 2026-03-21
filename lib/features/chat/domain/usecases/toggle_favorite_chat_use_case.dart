import '../../../auth/domain/repostories/i_auth_repository.dart';
import '../models/chat_config/chat_config.dart';
import '../repositories/i_chat_repository.dart';

class ToggleFavoriteChatUseCase {
  final IChatRepository _chatRepository;
  final IAuthRepository _authRepository;

  ToggleFavoriteChatUseCase({
    required IChatRepository chatRepository,
    required IAuthRepository authRepository,
  }) : _chatRepository = chatRepository,
       _authRepository = authRepository;

  Future<void> call({
    required String chatId,
  }) async {
    final uid = await _authRepository.requireUserId();

    final existingConfig = await _chatRepository.getConfig(
      uid: uid,
      chatId: chatId,
    );

    /// Toggle
    final isFavorite = existingConfig.isFavorite(
      uid,
    );

    final updatedConfig = existingConfig.copyWith(
      favorite: isFavorite ? [] : [uid],
    );

    await _chatRepository.updateConfig(
      uid: uid,
      chatId: chatId,
      config: updatedConfig,
    );
  }
}
