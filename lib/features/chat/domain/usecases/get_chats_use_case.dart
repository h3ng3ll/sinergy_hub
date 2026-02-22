import '../../../auth/domain/repostories/i_auth_repository.dart';
import '../../../user/domain/models/user_data/user_data.dart';
import '../../../user/domain/repositories/i_user_repository.dart';
import '../../data/models/chat_dto/chat_dto.dart';
import '../models/chat/chat.dart';
import '../repositories/i_chat_repository.dart';

class GetChatsUseCase {
  final IChatRepository _chatRepository;
  final IUserRepository _userRepository;
  final IAuthRepository _authRepository;

  GetChatsUseCase({
    required IChatRepository chatRepository,
    required IUserRepository userRepository,
    required IAuthRepository authRepository,
  }) : _chatRepository = chatRepository,
       _authRepository = authRepository,
       _userRepository = userRepository;

  Stream<List<Chat>> call() async* {
    final uid = await _authRepository.requireUserId();
    yield* _chatRepository
        .getStream(
          uid,
        )
        .asyncMap(
          (List<ChatDto> chatsDto) async {
            final uids = chatsDto
                .map(
                  (ChatDto chat) => chat.participants.firstWhere(
                    (e) => e != uid,
                  ),
                )
                .toList();
            final List<UserData> users = await _userRepository.getUsersById(
              ids: uids,
            );

            final userById = {for (var u in users) u.uid: u};

            final chats = chatsDto.map((ChatDto chat) {
              final UserData user = userById[uids.first]!;

              return chat.toDomain(
                user,
              );
            }).toList();
            return chats;
          },
        );
  }
}
