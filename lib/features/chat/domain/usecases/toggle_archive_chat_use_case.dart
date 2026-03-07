import '../../../auth/domain/repostories/i_auth_repository.dart';
import '../models/chat_config/chat_config.dart';
import '../repositories/i_chat_config_repository.dart';

class ToggleArchiveChatUseCase {
  final IChatConfigRepository _chatConfigRepository;
  final IAuthRepository _authRepository;

  ToggleArchiveChatUseCase({
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

    final currentArchivedStatus = existingConfig?.archived ?? false;

    final updatedConfig =
        (existingConfig ??
                ChatConfig(
                  chatId: chatId,
                ))
            .copyWith(
              archived: !currentArchivedStatus,
            );

    await _chatConfigRepository.updateConfig(
      uid: uid,
      config: updatedConfig,
    );
  }
}
