import 'dart:async';

import '../../../../core/databases/hive_database.dart';
import '../../domain/models/chat_message/chat_message.dart';
import '../../domain/models/chat_messages_cache_info/chat_messages_cache_info.dart';
import '../../domain/repositories/i_chat_message_local_repository.dart';
import '../models/chat_messages_cache/chat_messages_cache.dart';

/// Hive-backed [IChatMessageLocalRepository]: one `chat_messages` box, one
/// entry per (user, chat) pair keyed `'<uid>|<chatId>'`.
class ChatMessageHiveRepository implements IChatMessageLocalRepository {
  final HiveDatabase _hiveDatabase;

  ChatMessageHiveRepository({
    required this._hiveDatabase,
  });

  final _boxName = 'chat_messages';

  /// Writes are read-modify-write on one entry; chaining them keeps the live
  /// listener and an older-page fetch from overwriting each other.
  Future<void> _pendingWrite = Future.value();

  Future<void> _serialized(Future<void> Function() write) {
    final next = _pendingWrite.then((_) => write());
    _pendingWrite = next.catchError((_) {});
    return next;
  }

  String _key(String uid, String chatId) => '$uid|$chatId';

  Future<ChatMessagesCache> _read(String uid, String chatId) async {
    final box = await _hiveDatabase.getBox<ChatMessagesCache>(_boxName);
    return box.get(_key(uid, chatId)) ?? ChatMessagesCache(chatId: chatId);
  }

  Future<void> _write(String uid, ChatMessagesCache cache) async {
    final box = await _hiveDatabase.getBox<ChatMessagesCache>(_boxName);
    await box.put(_key(uid, cache.chatId), cache);
  }

  @override
  Stream<List<ChatMessage>> watch({
    required String uid,
    required String chatId,
  }) async* {
    final box = await _hiveDatabase.getBox<ChatMessagesCache>(_boxName);
    final key = _key(uid, chatId);

    /// Subscribe to changes BEFORE reading the current value, so a write
    /// landing in between is never lost.
    final controller = StreamController<List<ChatMessage>>();
    final subscription = box
        .watch(key: key)
        .listen((_) => controller.add(box.get(key)?.messages ?? const []));
    controller.add(box.get(key)?.messages ?? const []);
    try {
      yield* controller.stream;
    } finally {
      await subscription.cancel();
      await controller.close();
    }
  }

  @override
  Future<ChatMessagesCacheInfo> info({
    required String uid,
    required String chatId,
  }) async {
    final cache = await _read(uid, chatId);
    return ChatMessagesCacheInfo(
      oldestCreatedAt: cache.messages.firstOrNull?.createdAt,
      latestCreatedAt: cache.messages.lastOrNull?.createdAt,
      reachedStart: cache.reachedStart,
    );
  }

  @override
  Future<void> upsert({
    required String uid,
    required String chatId,
    required List<ChatMessage> messages,
  }) {
    if (messages.isEmpty) return Future.value();
    return _serialized(() async {
      final cache = await _read(uid, chatId);
      final byId = {
        for (final message in cache.messages) message.id: message,
        for (final message in messages) message.id: message,
      };
      final merged = byId.values.toList()
        ..sort(
          (a, b) => a.createdAt.compareTo(b.createdAt),
        );
      await _write(
        uid,
        cache.copyWith(messages: merged),
      );
    });
  }

  @override
  Future<void> markReachedStart({
    required String uid,
    required String chatId,
  }) => _serialized(() async {
    final cache = await _read(uid, chatId);
    if (cache.reachedStart) return;
    await _write(
      uid,
      cache.copyWith(reachedStart: true),
    );
  });
}
