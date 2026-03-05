import '../../../auth/domain/repostories/i_auth_repository.dart';
import '../models/chat/chat.dart';
import '../repositories/i_chat_repository.dart';
import 'bundle_chat_use_case.dart';

class SearchChatsUseCase {
  final IChatRepository _chatRepository;
  final IAuthRepository _authRepository;
  final BundleChatUseCase _bundleChatUseCase;

  SearchChatsUseCase({
    required IChatRepository chatRepository,
    required IAuthRepository authRepository,
    required BundleChatUseCase bundleChatUseCase,
  }) : _chatRepository = chatRepository,
       _authRepository = authRepository,
       _bundleChatUseCase = bundleChatUseCase;

  /// Accept UID of participants which not include current user
  Future<List<Chat>> call({
    required String query,
  }) async {
    final uid = await _authRepository.requireUserId();
    final chatsDto = await _chatRepository.search(
      uid: uid,
      query: query,
    );

    return Stream.fromIterable(
      chatsDto,
    ).asyncMap(
      (e) async {
        return await _bundleChatUseCase.call(
          chat: e,
        );
      },
    ).toList();
  }
}
