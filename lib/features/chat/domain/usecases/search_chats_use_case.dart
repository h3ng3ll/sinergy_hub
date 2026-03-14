import '../../../auth/domain/repostories/i_auth_repository.dart';
import '../../data/models/chat_dto_pg_state.dart/chat_dto_pg_state.dart';
import '../models/chat/chat.dart';
import '../models/chat_pg_state.dart/chat_pg_state.dart';
import '../models/e_chat_filter.dart';
import '../repositories/i_chat_repository.dart';
import 'bundle_chat_use_case.dart';
import 'get_chat_config_use_case.dart';

class SearchChatsUseCase {
  final IChatRepository _chatRepository;
  final IAuthRepository _authRepository;
  final BundleChatUseCase _bundleChatUseCase;
  final GetChatConfigUseCase _getChatConfigsUseCase;

  SearchChatsUseCase({
    required IChatRepository chatRepository,
    required IAuthRepository authRepository,
    required BundleChatUseCase bundleChatUseCase,
    required GetChatConfigUseCase getChatConfigsUseCase,
  }) : _chatRepository = chatRepository,
       _authRepository = authRepository,
       _bundleChatUseCase = bundleChatUseCase,
       _getChatConfigsUseCase = getChatConfigsUseCase;

  /// Accept UID of participants which not include current user
  Future<ChatPgState> call({
    required ChatPgState chatState,
    required String query,
    EChatFilter filter = EChatFilter.all,
  }) async {
    final uid = await _authRepository.requireUserId();

    final ChatDtoPgState chatsDto = await _chatRepository.get(
      chatState: chatState,
      uid: uid,
      filter: filter,
      query: query,
    );


    final chats = chatsDto.chats;
    final List<Chat> bundledChats =
        await Stream.fromIterable(
          chats,
        ).asyncMap(
          (e) async {
            return await _bundleChatUseCase.call(
              chat: e,
            );
          },
        ).toList();

    return chatState.copyWith(
      chats: [
        ...chatState.chats,
        ...bundledChats,

      ],
      hasMore: chatsDto.hasMore,
      pageSize: chatsDto.pageSize,
      lastDocument: chatsDto.lastDocument,
    );
  }
}
