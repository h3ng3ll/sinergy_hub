import '../../../auth/domain/repostories/i_auth_repository.dart';
import '../../../chat/domain/exception/no_found_chat_exception.dart';
import '../../../chat/domain/repositories/i_chat_repository.dart';


class FindMatchChatIdUseCase {
  final IAuthRepository _authRepository;
  final IChatRepository _chatRepository;

  FindMatchChatIdUseCase({
    required IAuthRepository authRepository,
    required IChatRepository chatRepository,
  }) : _authRepository = authRepository,
       _chatRepository = chatRepository;

  /// fetch users and exclude already matched people if it
  /// found include current user
  Future<String> call({
    required String matchId,
  }) async {
    final uid = await _authRepository.requireUserId();

    final chat = await _chatRepository.chatByParticipates(
      uid: uid,
      participates:  matchId.split('_').toList(),
    );
    if (chat == null) {
      throw NoFoundChatException();
    }
    return chat.chatId;
  }
}
