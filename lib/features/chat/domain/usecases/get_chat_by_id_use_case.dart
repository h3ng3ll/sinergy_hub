import '../../../auth/domain/repostories/i_auth_repository.dart';
import '../../../user/domain/models/user_data/user_data.dart';
import '../../../user/domain/repositories/i_user_repository.dart';
import '../models/chat/chat.dart';
import '../repositories/i_chat_repository.dart';

class GetChatByIdUseCase {
  final IChatRepository _chatRepository;
  final IUserRepository _userRepository;
  final IAuthRepository _authRepository;

  GetChatByIdUseCase({
    required IChatRepository chatRepository,
    required IUserRepository userRepository,
    required IAuthRepository authRepository,
  }) : _chatRepository = chatRepository,
       _userRepository = userRepository,
       _authRepository = authRepository;

  Stream<Chat> call({
    required String chatId,
  }) async* {
    final uid = await _authRepository.requireUserId();

    yield* _chatRepository
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
