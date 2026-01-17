import '../../data/models/chat_dto/chat_dto.dart';
import '../models/chat/chat.dart';
import '../models/chat_message/chat_message.dart';
import '../repositories/i_chat_message_repository.dart';
import '../repositories/i_chat_repository.dart';

class SendMessageUseCase {
  final IChatMessageRepository _chatMessageRepository;
  final IChatRepository _chatRepository;

  SendMessageUseCase({
    required IChatMessageRepository chatMessageRepository,
    required IChatRepository chatRepository,
  }) : _chatMessageRepository = chatMessageRepository,
       _chatRepository = chatRepository;

  Future<void> call({
    required ChatMessage message,
    required Chat chat,
  }) async {
    _chatMessageRepository.create(
      message: message,
      chatId: chat.chatId,
    );
    final updatedChat = ChatDto.fromDomain(
      chat.copyWith(
        lastMessage: message.message,
      ),
    );
    _chatRepository.update(
      chat: updatedChat,
    );
  }
}
