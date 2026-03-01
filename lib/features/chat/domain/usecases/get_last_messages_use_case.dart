import '../models/chat_message/chat_message.dart';
import '../repositories/i_chat_message_repository.dart';

class GetLastMessagesUseCase {
  final IChatMessageRepository _chatMessageRepository;

  GetLastMessagesUseCase({
    required IChatMessageRepository chatMessageRepository,
  }) : _chatMessageRepository = chatMessageRepository;

  /// At the beginning Load last 30 messages
  /// and added 1 by 1 data after
  /// creation
  Stream<List<ChatMessage>> call({
    required String chatId,
  }) {
    return _chatMessageRepository.getLastMessagesStream(
      chatId: chatId,
    );
  }
}
