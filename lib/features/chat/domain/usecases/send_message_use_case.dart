import '../models/chat_message/chat_message.dart';
import '../repositories/i_chat_message_repository.dart';

class SendMessageUseCase {
  final IChatMessageRepository _chatMessageRepository;

  SendMessageUseCase({
    required IChatMessageRepository chatMessageRepository,
  }) : _chatMessageRepository = chatMessageRepository;

  Future<void> call({
    required String chatId,
    required ChatMessage message,
  }) async {
    _chatMessageRepository.create(
      message: message,
      chatId: chatId,
    );
  }
}
