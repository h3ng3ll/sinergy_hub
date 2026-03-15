import '../../../auth/domain/repostories/i_auth_repository.dart';
import '../../../chat/domain/exception/no_found_chat_exception.dart';
import '../../../chat/domain/repositories/i_chat_repository.dart';
import '../../../user/domain/models/users_data_pg_state/users_data_pg_state.dart';
import '../../../user/domain/repositories/i_user_repository.dart';
import '../models/matches_filter/matches_filter.dart';
import 'get_excluded_matches_use_case.dart';

class LookForMatchesUseCase {
  final IAuthRepository _authRepository;
  final IChatRepository _chatRepository;

  LookForMatchesUseCase({
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
      participates: [
        uid,
        matchId,
      ],
    );
    if (chat == null) {
      throw NoFoundChatException();
    }
    return chat.chatId;
  }
}
