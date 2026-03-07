import '../../../auth/domain/repostories/i_auth_repository.dart';
import '../models/chat_config/chat_config.dart';
import '../repositories/i_chat_config_repository.dart';

class ToggleFavoriteChatUseCase {
  final IChatConfigRepository _chatConfigRepository;
  final IAuthRepository _authRepository;

  ToggleFavoriteChatUseCase({
    required IChatConfigRepository chatConfigRepository,
    required IAuthRepository authRepository,
  }) : _chatConfigRepository = chatConfigRepository,
       _authRepository = authRepository;

  Future<void> call({
    required String chatId,
  }) async {
    final uid = await _authRepository.requireUserId();

    final existingConfig = await _chatConfigRepository.getConfig(
      uid: uid,
      chatId: chatId,
    );

    final currentFavoriteStatus = existingConfig?.favorite ?? false;

    final updatedConfig =
        (existingConfig ??
                ChatConfig(
                  chatId: chatId,
                ))
            .copyWith(
              favorite: !currentFavoriteStatus,
            );

    await _chatConfigRepository.updateConfig(
      uid: uid,
      config: updatedConfig,
    );
  }
}
