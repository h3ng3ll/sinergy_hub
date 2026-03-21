import '../../../auth/domain/repostories/i_auth_repository.dart';
import '../models/chat_pg_state.dart/chat_pg_state.dart';
import '../models/e_chat_filter.dart';
import '../repositories/i_chat_repository.dart';
import 'get_chat_config_use_case.dart';

class SearchChatsUseCase {
  final IChatRepository _chatRepository;
  final IAuthRepository _authRepository;

  SearchChatsUseCase({
    required IChatRepository chatRepository,
    required IAuthRepository authRepository,

    required GetChatConfigUseCase getChatConfigsUseCase,
  }) : _chatRepository = chatRepository,
       _authRepository = authRepository;

  /// Accept UID of participants which not include current user
  Future<ChatPgState> call({
    required ChatPgState chatState,
    required String query,
    EChatFilter filter = EChatFilter.all,
  }) async {
    final uid = await _authRepository.requireUserId();

    final ChatPgState chatsState = await _chatRepository.get(
      chatState: chatState,
      uid: uid,
      filter: filter,
      query: query,
    );

    return chatsState;
  }
}
