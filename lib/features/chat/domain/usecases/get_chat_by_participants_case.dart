import '../../../auth/domain/repostories/i_auth_repository.dart';
import '../models/chat/chat.dart';
import '../repositories/i_chat_repository.dart';

class GetChatByParticipantsCase {
  final IChatRepository _chatRepository;
  final IAuthRepository _authRepository;

  GetChatByParticipantsCase({
    required IChatRepository chatRepository,
    required IAuthRepository authRepository,
  }) : _chatRepository = chatRepository,
       _authRepository = authRepository;

  Future<Chat?> call({
    required List<String> participates,
  }) async {
    final uid = await _authRepository.requireUserId();
    final Chat? chat = await _chatRepository.chatByParticipates(
      participates: participates, uid: uid,
    );
    return chat;
  }
}
