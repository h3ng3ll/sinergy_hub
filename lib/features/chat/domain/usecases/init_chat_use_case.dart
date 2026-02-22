import '../../../auth/domain/repostories/i_auth_repository.dart';
import '../../../user/domain/models/user_data/user_data.dart';
import '../models/chat/chat.dart';
import '../repositories/i_chat_repository.dart';

class InitChatUseCase {
  final IChatRepository _chatRepository;
  final IAuthRepository _authRepository;

  InitChatUseCase({
    required IChatRepository chatRepository,
    required IAuthRepository authRepository,
  }) : _chatRepository = chatRepository,
       _authRepository = authRepository;

  Future<Chat> call({
    required List<String> participants,
  }) async {
    final uid = await _authRepository.requireUserId();
    return await _chatRepository.create(
      Chat(
        user: UserData.none(),
        lastMessageSent: DateTime.now(),
        participants: [
          uid,
          ...participants,
        ],
        createdAt: DateTime.now(),
      ),
    );
  }
}
