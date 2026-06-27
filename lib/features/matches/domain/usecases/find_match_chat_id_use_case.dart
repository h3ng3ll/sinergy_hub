import '../../../auth/domain/repostories/i_auth_repository.dart';
import '../../../chat/domain/exception/no_found_chat_exception.dart';
import '../../../chat/domain/repositories/i_chat_repository.dart';
import '../../../user/data/services/user_service.dart';

class FindMatchChatIdUseCase {
  final IAuthRepository _authRepository;
  final IChatRepository _chatRepository;
  final UserService _userService;

  FindMatchChatIdUseCase({
    required IAuthRepository authRepository,
    required IChatRepository chatRepository,
    required UserService userService,
  }) : _userService = userService,
       _authRepository = authRepository,
       _chatRepository = chatRepository;

  /// fetch users and exclude already matched people if it
  /// found include current user
  Future<String> call({
    required String matchId,
  }) async {
    final uid = await _authRepository.requireUserId();

    final participates = _userService.uidKeyToList(
      matchId,
    );
    final chat = await _chatRepository.chatByParticipates(
      uid: uid,
      participates: participates,
    );
    if (chat == null) {
      throw NoFoundChatException();
    }
    return chat.chatId;
  }
}
