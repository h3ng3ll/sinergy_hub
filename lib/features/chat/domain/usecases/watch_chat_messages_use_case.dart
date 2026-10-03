import 'dart:async';

import '../../../auth/domain/repostories/i_auth_repository.dart';
import '../models/chat_message/chat_message.dart';
import '../repositories/i_chat_message_local_repository.dart';
import '../repositories/i_chat_message_repository.dart';

/// Cache-first message stream for an open chat.
///
/// The local cache is the single source the UI reads: it emits immediately
/// with whatever is stored. Meanwhile a backend listener fetches only the
/// messages newer than the latest cached one (or the newest page on a
/// chat's first open) and writes them into the cache, which re-emits.
class WatchChatMessagesUseCase {
  final IChatMessageLocalRepository _localRepository;
  final IChatMessageRepository _remoteRepository;
  final IAuthRepository _authRepository;

  WatchChatMessagesUseCase({
    required this._localRepository,
    required this._remoteRepository,
    required this._authRepository,
  });

  Stream<List<ChatMessage>> call({
    required String chatId,
  }) {
    StreamSubscription<List<ChatMessage>>? localSubscription;
    StreamSubscription<List<ChatMessage>>? remoteSubscription;
    var isCancelled = false;
    late final StreamController<List<ChatMessage>> controller;

    Future<void> start() async {
      final uid = await _authRepository.requireUserId();
      final info = await _localRepository.info(
        uid: uid,
        chatId: chatId,
      );
      if (isCancelled) return;

      localSubscription = _localRepository
          .watch(
            uid: uid,
            chatId: chatId,
          )
          .listen(
            controller.add,
            onError: controller.addError,
          );

      var isFirstBatch = true;
      remoteSubscription = _remoteRepository
          .listenMessagesSince(
            chatId: chatId,
            after: info.latestCreatedAt,
          )
          .listen(
            (messages) async {
              final isWholeHistory =
                  isFirstBatch &&
                  info.isEmpty &&
                  messages.length < kChatMessagesPageSize;
              isFirstBatch = false;
              await _localRepository.upsert(
                uid: uid,
                chatId: chatId,
                messages: messages,
              );
              if (isWholeHistory) {
                await _localRepository.markReachedStart(
                  uid: uid,
                  chatId: chatId,
                );
              }
            },
            onError: controller.addError,
          );
    }

    controller = StreamController<List<ChatMessage>>(
      onListen: () async {
        try {
          await start();
        } catch (e, s) {
          controller.addError(e, s);
        }
      },
      onCancel: () async {
        isCancelled = true;
        await localSubscription?.cancel();
        await remoteSubscription?.cancel();
      },
    );

    return controller.stream;
  }
}
