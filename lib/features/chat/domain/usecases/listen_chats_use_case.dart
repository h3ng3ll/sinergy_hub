import '../../../auth/domain/repostories/i_auth_repository.dart';
import '../models/chat/chat.dart';
import '../repositories/i_chat_repository.dart';

class ListenChatsUseCase {
  final IChatRepository _chatRepository;
  final IAuthRepository _authRepository;


  ListenChatsUseCase({
    required IChatRepository chatRepository,
    required IAuthRepository authRepository,
  }) : _chatRepository = chatRepository,
       _authRepository = authRepository;

  Stream<List<Chat>> call() async* {
    final uid = await _authRepository.requireUserId();

    yield* _chatRepository
        .getStream(
          uid,
        );
  }
}
