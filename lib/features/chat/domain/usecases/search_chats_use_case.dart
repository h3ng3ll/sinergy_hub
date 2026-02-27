import '../../../auth/domain/repostories/i_auth_repository.dart';
import '../models/chat/chat.dart';
import '../repositories/i_chat_repository.dart';

class SearchChatsUseCase {
  final IChatRepository _chatRepository;
  final IAuthRepository _authRepository;

  SearchChatsUseCase({
    required IChatRepository chatRepository,
    required IAuthRepository authRepository,
  }) : _chatRepository = chatRepository,
       _authRepository = authRepository;

  /// Accept UID of participants which not include current user
  Future<List<Chat>> call({
    required String query,
  }) async {
    final uid = await _authRepository.requireUserId();
    return await _chatRepository.search(
      uid: uid,
      query: query,
    );
  }
}
