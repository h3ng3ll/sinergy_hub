import '../../../user/domain/models/user_data/user_data.dart';
import '../models/chat/chat.dart';
import '../repositories/i_chat_repository.dart';

class InitChatUseCase {
  final IChatRepository _chatRepository;

  InitChatUseCase({
    required IChatRepository chatRepository,
  }) : _chatRepository = chatRepository;

  Future<void> call({
    required List<String> participants,
  }) async {
    await _chatRepository.create(
        Chat(
          user: UserData.none(),
          lastMessageSent: DateTime.now(),
          participants: participants,
          createdAt: DateTime.now(),
        ),
    );
  }
}
