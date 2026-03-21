import '../../../auth/domain/repostories/i_auth_repository.dart';
import '../../../user/domain/repositories/i_user_repository.dart';
import '../../data/models/chat_dto/chat_dto.dart';
import '../models/chat/chat.dart';
import '../repositories/i_chat_repository.dart';

class UpdateChatInfoUseCase {
  final IChatRepository _chatRepository;


  UpdateChatInfoUseCase({
    required IChatRepository chatRepository,
    required IAuthRepository authRepository,
  }) : _chatRepository = chatRepository;

  Future<void> call({
    required String chatId,
    required Chat chat,
  }) async {
    await _chatRepository.update(
      chat: chat,
    );
  }
}
