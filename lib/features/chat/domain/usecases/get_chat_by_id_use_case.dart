import '../../../auth/domain/repostories/i_auth_repository.dart';
import '../../../user/domain/models/user_data/user_data.dart';
import '../../../user/domain/repositories/i_user_repository.dart';
import '../models/chat/chat.dart';
import '../repositories/i_chat_repository.dart';

class GetChatByIdUseCase {
  final IChatRepository _chatRepository;

  GetChatByIdUseCase({
    required IChatRepository chatRepository,
  }) : _chatRepository = chatRepository;

  Future<Chat> call({
    required String chatId,
  }) async {
    final chat = await _chatRepository.getById(
      chatId: chatId,
    );
    return chat.toDomain();
  }
}
