import '../../../auth/domain/repostories/i_auth_repository.dart';
import '../../../onboard_survey/domain/models/specialization/specialization.dart';
import '../../../user/domain/models/user_data/user_data.dart';
import '../../../user/domain/repositories/i_user_repository.dart';
import '../models/chat/chat.dart';
import '../models/chat_info/chat_info.dart';
import '../repositories/i_chat_repository.dart';

class InitChatUseCase {
  final IChatRepository _chatRepository;
  final IAuthRepository _authRepository;
  final IUserRepository _userRepository;

  InitChatUseCase({
    required IChatRepository chatRepository,
    required IAuthRepository authRepository,
    required IUserRepository userRepository,
  }) : _chatRepository = chatRepository,
       _authRepository = authRepository,
       _userRepository = userRepository;

  /// Accept UID of participants which not include current user
  Future<Chat> call({
    required List<String> participants,
  }) async {
    final uid = await _authRepository.requireUserId();

    final userData = await _userRepository.getUserById(
      id: participants.firstWhere(
        (e) => !e.contains(uid),
      ),
    );
    final info = ChatInfo(
      specialization: userData!.profiler.specialization,
      title: '${userData.firstName} ${userData.lastName}',
      cover: userData.avatarUrl,
    );

    return await _chatRepository.create(
      Chat(
        lastMessageSent: DateTime.now(),
        participants: [
          uid,
          ...participants,
        ],
        createdAt: DateTime.now(),
        info: info,
      ),
    );
  }
}
