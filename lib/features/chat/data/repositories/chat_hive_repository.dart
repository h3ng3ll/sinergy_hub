import 'dart:async';

import '../../../../core/databases/hive_database.dart';
import '../../domain/models/chat/chat.dart';
import '../../domain/repositories/i_chat_local_repository.dart';
import '../models/chats_cache/chats_cache.dart';

/// Hive-backed [IChatLocalRepository]: one `chats` box, one entry per user
/// keyed by uid.
class ChatHiveRepository implements IChatLocalRepository {
  final HiveDatabase _hiveDatabase;

  ChatHiveRepository({
    required HiveDatabase hiveDatabase,
  }) : _hiveDatabase = hiveDatabase;

  final _boxName = 'chats';

  @override
  Stream<List<Chat>?> watch({
    required String uid,
  }) async* {
    final box = await _hiveDatabase.getBox<ChatsCache>(_boxName);

    /// Subscribe to changes BEFORE reading the current value: a write landing
    /// between the read and the subscription would otherwise be lost and the
    /// list would never leave its loading state.
    final controller = StreamController<List<Chat>?>();
    final subscription = box
        .watch(key: uid)
        .listen((_) => controller.add(box.get(uid)?.chats));
    controller.add(box.get(uid)?.chats);
    try {
      yield* controller.stream;
    } finally {
      await subscription.cancel();
      await controller.close();
    }
  }

  @override
  Future<void> replaceAll({
    required String uid,
    required List<Chat> chats,
  }) async {
    final box = await _hiveDatabase.getBox<ChatsCache>(_boxName);
    await box.put(
      uid,
      ChatsCache(chats: chats),
    );
  }
}
