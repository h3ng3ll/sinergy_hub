import '../../../user/domain/models/user_data/user_data.dart';
import '../../../user/domain/repositories/i_user_repository.dart';
import '../../data/models/chat_dto/chat_dto.dart';
import '../models/chat/chat.dart';
import '../repositories/i_chat_repository.dart';

class GetChatsUseCase {
  final IChatRepository _chatRepository;
  final IUserRepository _userRepository;

  GetChatsUseCase({
    required IChatRepository chatRepository,
    required IUserRepository userRepository,
  }) : _chatRepository = chatRepository,
       _userRepository = userRepository;

  Stream<List<Chat>> call(
    String uid,
  ) {
    return _chatRepository
        .get(
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
            final users = await _userRepository.getUsersById(
              ids: uids,
            );

            final userById = {for (var u in users) u.uid: u};

            final chats = chatsDto.map((ChatDto chat) {
              final UserData user = userById[uid]!;

              return chat.toDomain(
                user,
              );
            }).toList();
            return chats;
          },
        );
  }
}
