import '../../../auth/domain/repostories/i_auth_repository.dart';
import '../../../user/domain/repositories/i_user_repository.dart';
import '../../data/models/chat_dto/chat_dto.dart';
import '../models/chat/chat.dart';
import '../repositories/i_chat_repository.dart';
import 'bundle_chat_use_case.dart';

class ListenChatsUseCase {
  final IChatRepository _chatRepository;
  final IAuthRepository _authRepository;
  final BundleChatUseCase _bundleChatUseCase;

  ListenChatsUseCase({
    required IChatRepository chatRepository,
    required IUserRepository userRepository,
    required IAuthRepository authRepository,
    required BundleChatUseCase bundleChatUseCase,
  }) : _chatRepository = chatRepository,
       _authRepository = authRepository,
       _bundleChatUseCase = bundleChatUseCase;

  Stream<List<Chat>> call() async* {
    final uid = await _authRepository.requireUserId();

    yield* _chatRepository
        .getStream(
          uid,
        )
        .asyncMap(
          (List<ChatDto> chatsDto) async {
            final chats = await Future.wait(
              chatsDto.map(
                (ChatDto chat) async {
                  return await _bundleChatUseCase.call(
                    chat: chat,
                  );
                },
              ),
            );

            return chats;
          },
        );
  }
}
