import '../../../auth/domain/repostories/i_auth_repository.dart';
import '../repositories/i_chat_repository.dart';

class ToggleArchiveChatUseCase {
  final IAuthRepository _authRepository;
  final IChatRepository _chatRepository;

  ToggleArchiveChatUseCase({
    required IAuthRepository authRepository,
    required IChatRepository chatRepository,
  }) :
       _authRepository = authRepository,
       _chatRepository = chatRepository;

  Future<void> call({
    required String chatId,
  }) async {
    final uid = await _authRepository.requireUserId();

    final existingConfig = await _chatRepository.getConfig(
      uid: uid,
      chatId: chatId,
    );

    final currentArchivedStatus = existingConfig.archived ?? false;

    final updatedConfig = existingConfig .copyWith(
      archived: !currentArchivedStatus,
    );

    await _chatRepository.updateConfig(
      chatId: chatId,
      uid: uid,
      config: updatedConfig,
    );
  }
}
