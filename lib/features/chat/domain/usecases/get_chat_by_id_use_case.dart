import '../../../auth/domain/repostories/i_auth_repository.dart';

import '../models/chat/chat.dart';
import '../repositories/i_chat_repository.dart';

class GetChatByIdUseCase {
  final IChatRepository _chatRepository;
  final IAuthRepository _authRepository;

  GetChatByIdUseCase({
    required IChatRepository chatRepository,
    required IAuthRepository authRepository,
  }) : _chatRepository = chatRepository,
       _authRepository = authRepository;

  Future<Chat> call({
    required String chatId,
    bool preferCache = false,
  }) async {
    final uid = await _authRepository.requireUserId();
    final chat = await _chatRepository.getById(
      chatId: chatId,
      uid: uid,
      preferCache: preferCache,
    );
    return chat;
  }
}
