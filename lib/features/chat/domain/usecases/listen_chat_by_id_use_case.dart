import '../../../auth/domain/repostories/i_auth_repository.dart';
import '../models/chat/chat.dart';
import '../repositories/i_chat_repository.dart';

class ListenChatByIdUseCase {
  final IChatRepository _chatRepository;
  final IAuthRepository _authRepository;

  ListenChatByIdUseCase({
    required IChatRepository chatRepository,
    required IAuthRepository authRepository,
  }) : _chatRepository = chatRepository,
       _authRepository = authRepository;

  Stream<Chat> call({
    required String chatId,
  }) async* {
    final uid = await _authRepository.requireUserId();

    yield* _chatRepository.listenByIdStream(
      uid: uid,
      chatId: chatId,
    );
  }
}
