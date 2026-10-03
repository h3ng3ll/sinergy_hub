import 'dart:async';

import '../../../auth/domain/repostories/i_auth_repository.dart';
import '../models/chat/chat.dart';
import '../repositories/i_chat_local_repository.dart';
import '../repositories/i_chat_repository.dart';

/// Cache-first chat list.
///
/// The local cache is the single source the UI reads: it emits immediately
/// with the stored chats. The live backend listener keeps the cache in sync
/// (new messages, typing, archive/favorite, blocks, removed chats), so
/// filtering and searching never need another backend request.
class WatchChatsUseCase {
  final IChatLocalRepository _localRepository;
  final IChatRepository _remoteRepository;
  final IAuthRepository _authRepository;

  WatchChatsUseCase({
    required IChatLocalRepository localRepository,
    required IChatRepository remoteRepository,
    required IAuthRepository authRepository,
  }) : _localRepository = localRepository,
       _remoteRepository = remoteRepository,
       _authRepository = authRepository;

  Stream<List<Chat>> call() {
    StreamSubscription<List<Chat>?>? localSubscription;
    StreamSubscription<List<Chat>>? remoteSubscription;
    var isCancelled = false;
    late final StreamController<List<Chat>> controller;

    Future<void> start() async {
      final uid = await _authRepository.requireUserId();
      if (isCancelled) return;

      localSubscription = _localRepository
          .watch(uid: uid)
          .where((chats) => chats != null)
          .listen(
            (chats) => controller.add(chats!),
            onError: controller.addError,
          );

      remoteSubscription = _remoteRepository
          .chatsSnapshotStream(uid: uid)
          .listen(
            (chats) async {
              try {
                await _localRepository.replaceAll(
                  uid: uid,
                  chats: chats,
                );
              } catch (e, s) {
                controller.addError(e, s);
              }
            },
            onError: controller.addError,
          );
    }

    controller = StreamController<List<Chat>>(
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
