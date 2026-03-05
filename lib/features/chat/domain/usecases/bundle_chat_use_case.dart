import '../../../auth/domain/repostories/i_auth_repository.dart';
import '../../../user/domain/exception/no_found_user_exception.dart';
import '../../../user/domain/models/user_data/user_data.dart';
import '../../../user/domain/repositories/i_user_repository.dart';
import '../../data/models/chat_dto/chat_dto.dart';
import '../exception/no_found_chat_exception.dart';
import '../models/chat/chat.dart';
import '../models/chat_info/chat_info.dart';
import '../repositories/i_chat_repository.dart';

class BundleChatUseCase {
  final IAuthRepository _authRepository;
  final IUserRepository _userRepository;

  BundleChatUseCase({
    required IUserRepository userRepository,
    required IAuthRepository authRepository,
  }) : _authRepository = authRepository,
       _userRepository = userRepository;

  Future<Chat> call({
    required ChatDto? chat,
  }) async {
    if (chat == null) {
      throw NoFoundChatException();
    }
    final uid = await _authRepository.requireUserId();

    final chatterId = chat.participants.firstWhere(
      (e) => e != uid,
    );

    final UserData? userData = await _userRepository.getUserById(
      id: chatterId,
    );

    if (userData == null) {
      throw NoFoundUserException();
    }

    return chat.toDomain(
      info: ChatInfo(
        title: '${userData.firstName} ${userData.lastName}',
        cover: userData.avatarUrl,
        specialization: userData.profiler.specialization,
      ),
    );
  }
}
