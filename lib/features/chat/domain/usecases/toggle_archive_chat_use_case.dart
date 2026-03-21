import '../../../auth/domain/repostories/i_auth_repository.dart';
import '../models/chat_config/chat_config.dart';
import '../repositories/i_chat_repository.dart';

class ToggleArchiveChatUseCase {
  final IAuthRepository _authRepository;
  final IChatRepository _chatRepository;

  ToggleArchiveChatUseCase({
    required IAuthRepository authRepository,
    required IChatRepository chatRepository,
  }) : _authRepository = authRepository,
       _chatRepository = chatRepository;

  Future<void> call({
    required String chatId,
  }) async {
    final uid = await _authRepository.requireUserId();

    final ChatConfig existingConfig = await _chatRepository.getConfig(
      uid: uid,
      chatId: chatId,
    );

    final isArchived = existingConfig.isArchived(
      uid,
    );

    /// Toggle
    final updatedConfig = existingConfig.copyWith(
      archived: isArchived ? [] : [uid],
    );

    await _chatRepository.updateConfig(
      chatId: chatId,
      uid: uid,
      config: updatedConfig,
    );
  }
}
