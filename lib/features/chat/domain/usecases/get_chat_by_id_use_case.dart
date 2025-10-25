import '../../../user/domain/models/user_data/user_data.dart';
import '../../../user/domain/repositories/i_user_repository.dart';
import '../models/chat/chat.dart';
import '../repositories/i_chat_repository.dart';

class GetChatByIdUseCase {
  final IChatRepository _chatRepository;
  final IUserRepository _userRepository;

  GetChatByIdUseCase({
    required IChatRepository chatRepository,
    required IUserRepository userRepository,
  }) : _chatRepository = chatRepository,
       _userRepository = userRepository;

  Stream<Chat> call({
    required String uid,
    required String chatId,
  }) {
    return _chatRepository
        .getByIdStream(
          uid: uid,
          chatId: chatId,
        )
        .asyncMap(
          (e) async {
            final UserData? user = await _userRepository.getUserById(
              id: e.participants.firstWhere(
                ((e) => e != uid),
              ),
            );
            return e.toDomain(
              user!,
            );
          },
        );
  }
}
