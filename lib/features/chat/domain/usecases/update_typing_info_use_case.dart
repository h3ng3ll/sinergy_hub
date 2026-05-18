import 'package:dartz/dartz.dart';

import '../../../../core/models/failures.dart';
import '../../../auth/domain/repostories/i_auth_repository.dart';
import '../failures/typing_status_failure.dart';
import '../repositories/i_chat_repository.dart';

class UpdateTypingInfoUseCase {
  final IChatRepository _chatRepository;
  final IAuthRepository _authRepository;

  UpdateTypingInfoUseCase({
    required IChatRepository chatRepository,
    required IAuthRepository authRepository,
  }) : _chatRepository = chatRepository,
       _authRepository = authRepository;

  Future<Either<void, Failure>> call({
    required String chatId,
    required bool status,
  }) async {
    try {
      final uid = await _authRepository.requireUserId();
      await _chatRepository.updateTypeInfo(
        isTyping: status,
        uid: uid,
        chatId: chatId,
      );
      return Left(null);
    } catch (_) {
      return Right(
        const TypingStatusFailure(),
      );
    }
  }
}
