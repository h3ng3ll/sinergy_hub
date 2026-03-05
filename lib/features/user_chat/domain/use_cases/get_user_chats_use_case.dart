import '../repositories/i_user_chat_repository.dart';

class GetUserChatsUseCase {
  final IUserChatRepository _chatRepository;

  GetUserChatsUseCase({
    required IUserChatRepository chatRepository,
  }) : _chatRepository = chatRepository;

  Future<List<String>> call({
    required String uid,
  }) async {
    return await _chatRepository.getChatIds(
      uid: uid,
    );
  }
}
