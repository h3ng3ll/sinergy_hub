import '../repositories/i_user_chat_repository.dart';

class CreateUserChatUseCase {
  final IUserChatRepository _chatRepository;

  CreateUserChatUseCase({
    required IUserChatRepository chatRepository,
  }) : _chatRepository = chatRepository;

  Future<void> call({
    required String uid,
    required String chatId,
  }) async {
    await _chatRepository.create(
      uid: uid,
      chatId: chatId,
    );
  }
}
