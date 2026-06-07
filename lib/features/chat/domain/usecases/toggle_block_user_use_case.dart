import 'package:dartz/dartz.dart';

import '../../../../core/failures/failure.dart';
import '../failures/block_user_failure.dart';
import '../repositories/i_chat_repository.dart';

class ToggleBlockUserUseCase {
  final IChatRepository _chatRepository;

  ToggleBlockUserUseCase({
    required IChatRepository chatRepository,
  }) : _chatRepository = chatRepository;

  /// Sets the block flag for [targetUid] (the OTHER user being blocked) on
  /// [chatId]. The key is the blocked user's id — you block them, not
  /// yourself.
  Future<Either<void, Failure>> call({
    required String chatId,
    required String targetUid,
    required bool blocked,
  }) async {
    try {
      await _chatRepository.setBlocked(
        uid: targetUid,
        chatId: chatId,
        blocked: blocked,
      );
      return const Left(null);
    } catch (_) {
      return Right(BlockUserFailure());
    }
  }
}
