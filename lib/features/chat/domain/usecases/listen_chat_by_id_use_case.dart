import '../../../auth/domain/repostories/i_auth_repository.dart';
import '../../../user/domain/models/user_data/user_data.dart';
import '../../../user/domain/repositories/i_user_repository.dart';
import '../models/chat/chat.dart';
import '../repositories/i_chat_repository.dart';

class ListenChatByIdUseCase {
  final IChatRepository _chatRepository;
  final IAuthRepository _authRepository;

  ListenChatByIdUseCase({
    required IChatRepository chatRepository,
    required IUserRepository userRepository,
    required IAuthRepository authRepository,
  }) : _chatRepository = chatRepository,
       _authRepository = authRepository;

  Stream<Chat> call({
    required String chatId,
  }) async* {
    final uid = await _authRepository.requireUserId();

    yield* _chatRepository
        .listenByIdStream(
          uid: uid,
          chatId: chatId,
        )
        .asyncMap(
          (e) async {
            return e.toDomain();
          },
        );
  }
}
