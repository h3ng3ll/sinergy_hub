import 'package:dartz/dartz.dart';

import '../../../../core/models/failures.dart';
import '../../../user/domain/models/user_data/user_data.dart';
import '../../../user/domain/usecases/get_current_user_data_use_case.dart';
import '../../../user/domain/usecases/get_users_use_case.dart';
import '../failures/chat_validation_failure.dart';
import '../models/chat/chat.dart';
import '../models/chat_page_data/chat_page_data.dart';
import 'get_chat_by_id_use_case.dart';

class OpenChatUseCase {
  final GetChatByIdUseCase _getChatByIdUseCase;
  final GetUsersUseCase _getUsersUseCase;
  final GetCurrentUserDataUseCase _getCurrentUserDataUseCase;

  OpenChatUseCase({
    required GetChatByIdUseCase getChatByIdUseCase,
    required GetUsersUseCase getUsersUseCase,
    required GetCurrentUserDataUseCase getCurrentUserDataUseCase,
  }) : _getChatByIdUseCase = getChatByIdUseCase,
       _getUsersUseCase = getUsersUseCase,
       _getCurrentUserDataUseCase = getCurrentUserDataUseCase;

  Future<Either<ChatPageData, Failure>> call({
    required String chatId,
  }) async {
    if (chatId.isEmpty) {
      return Right(
        const ChatValidationFailure('Chat id is empty'),
      );
    }
    final Chat chat = await _getChatByIdUseCase.call(
      chatId: chatId,
    );
    final List<UserData> users = await _getUsersUseCase.call(
      ids: chat.participants,
    );
    final UserData currentUser = await _getCurrentUserDataUseCase.call();

    final peer = users
        .where(
          (e) => e.uid != currentUser.uid,
        )
        .firstOrNull;
    if (peer == null) {
      return Right(
        const ChatValidationFailure(
          'Chat has no resolvable peer participant',
        ),
      );
    }

    return Left(
      ChatPageData(
        chat: chat,
        users: users,
        currentUser: currentUser,
        peerUid: peer.uid,
      ),
    );
  }
}
