import '../../../auth/domain/repostories/i_auth_repository.dart';
import '../repositories/i_chat_repository.dart';

class UpdateTypingInfoUseCase {
  final IChatRepository _chatRepository;
  final IAuthRepository _authRepository;

  UpdateTypingInfoUseCase({
    required IChatRepository chatRepository,
    required IAuthRepository authRepository,
  }) : _chatRepository = chatRepository,
       _authRepository = authRepository;

  Future<void> call({
    required String chatId,
    required bool status,
  }) async {
    final uid = await _authRepository.requireUserId();
    await _chatRepository.updateTypeInfo(
      isTyping: status,
      uid: uid,
      chatId: chatId,
    );
  }
}
