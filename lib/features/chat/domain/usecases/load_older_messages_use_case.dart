import 'package:dartz/dartz.dart';

import '../../../../core/failures/failure.dart';
import '../../../auth/domain/repostories/i_auth_repository.dart';
import '../failures/load_messages_failure.dart';
import '../repositories/i_chat_message_local_repository.dart';
import '../repositories/i_chat_message_repository.dart';

/// Extends a chat's history past its oldest cached message.
///
/// Everything already cached is on screen, so the backend is only asked for
/// the page before the oldest cached message, and never again once the start
/// of the conversation is cached. Fetched pages go into the cache, which
/// re-emits to the open chat.
class LoadOlderMessagesUseCase {
  final IChatMessageLocalRepository _localRepository;
  final IChatMessageRepository _remoteRepository;
  final IAuthRepository _authRepository;

  LoadOlderMessagesUseCase({
    required this._localRepository,
    required this._remoteRepository,
    required this._authRepository,
  });

  Future<Either<void, Failure>> call({
    required String chatId,
  }) async {
    try {
      final uid = await _authRepository.requireUserId();
      final info = await _localRepository.info(
        uid: uid,
        chatId: chatId,
      );
      final oldest = info.oldestCreatedAt;
      if (info.reachedStart || oldest == null) {
        return const Left(null);
      }

      final page = await _remoteRepository.fetchMessagesBefore(
        uid: uid,
        chatId: chatId,
        before: oldest,
      );
      await _localRepository.upsert(
        uid: uid,
        chatId: chatId,
        messages: page,
      );
      if (page.length < kChatMessagesPageSize) {
        await _localRepository.markReachedStart(
          uid: uid,
          chatId: chatId,
        );
      }
      return const Left(null);
    } catch (_) {
      return const Right(LoadMessagesFailure());
    }
  }
}
