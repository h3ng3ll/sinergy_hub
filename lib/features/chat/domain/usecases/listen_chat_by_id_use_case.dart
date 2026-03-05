import '../../../auth/domain/repostories/i_auth_repository.dart';
import '../../../user/domain/models/user_data/user_data.dart';
import '../../../user/domain/repositories/i_user_repository.dart';
import '../models/chat/chat.dart';
import '../repositories/i_chat_repository.dart';
import 'bundle_chat_use_case.dart';

class ListenChatByIdUseCase {
  final IChatRepository _chatRepository;
  final IAuthRepository _authRepository;
  final BundleChatUseCase _bundleChatUseCase;

  ListenChatByIdUseCase({
    required IChatRepository chatRepository,
    required IUserRepository userRepository,
    required IAuthRepository authRepository,
    required BundleChatUseCase bundleChatUseCase,
  }) : _chatRepository = chatRepository,
       _authRepository = authRepository,
       _bundleChatUseCase = bundleChatUseCase;

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
          (chat) async {
            return await _bundleChatUseCase.call(
              chat: chat,
            );
          },
        );
  }
}
