import '../../../auth/domain/repostories/i_auth_repository.dart';
import '../../data/models/chat_dto/chat_dto.dart';
import '../models/chat/chat.dart';
import '../models/chat_message/chat_message.dart';
import '../repositories/i_chat_message_repository.dart';
import '../repositories/i_chat_repository.dart';

class SendMessageUseCase {
  final IChatMessageRepository _chatMessageRepository;
  final IChatRepository _chatRepository;
  final IAuthRepository _authRepository;

  SendMessageUseCase({
    required IChatMessageRepository chatMessageRepository,
    required IChatRepository chatRepository,
    required IAuthRepository authRepository,
  }) : _chatMessageRepository = chatMessageRepository,
       _authRepository = authRepository,
       _chatRepository = chatRepository;

  Future<void> call({
    required String message,
    required Chat chat,
  }) async {
    final uid = await _authRepository.requireUserId();
    final chatMessage = ChatMessage(
      createdAt: DateTime.now(),
      sentUid: uid,
      message: message,
    );
    await _chatMessageRepository.create(
      message: chatMessage,
      chatId: chat.chatId,
    );
    final updatedChat = ChatDto.fromDomain(
      chat.copyWith(
        lastMessage: message,
      ),
    );
    await _chatRepository.update(
      chat: updatedChat,
    );
  }
}
