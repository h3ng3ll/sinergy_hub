import '../models/chat_message/chat_message.dart';
import '../repositories/i_chat_message_repository.dart';

class ListenChatMessagesUseCase {
  final IChatMessageRepository _chatMessageRepository;

  ListenChatMessagesUseCase({
    required IChatMessageRepository chatMessageRepository,
  }) : _chatMessageRepository = chatMessageRepository;

  Stream<List<ChatMessage>> call({
    required String chatId,
  }) {
    return _chatMessageRepository.getLastMessagesStream(
      chatId: chatId,
      uid: '',
    );
  }
}
