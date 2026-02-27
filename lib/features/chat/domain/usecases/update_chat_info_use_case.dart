import '../../data/models/chat_dto/chat_dto.dart';
import '../models/chat/chat.dart';
import '../repositories/i_chat_repository.dart';

class UpdateChatInfoUseCase {
  final IChatRepository _chatRepository;

  UpdateChatInfoUseCase({
    required IChatRepository chatRepository,
  }) : _chatRepository = chatRepository;

  Future<void> call({
    required String chatId,
    required Chat chat,
  }) async {
    final updatedChat = ChatDto.fromDomain(
      chat.copyWith(),
    );
    await _chatRepository.update(
      chat: updatedChat,
    );
  }
}
