import '../models/chat_message/chat_message.dart';
import '../models/chat_messages_cache_info/chat_messages_cache_info.dart';

/// Local, per-user cache of chat messages. Every method is scoped by the
/// signed-in user's [uid], so accounts sharing a device never read each
/// other's cache.
abstract class IChatMessageLocalRepository {
  /// Emits the cached messages (sorted by `createdAt`) right away, then on
  /// every change.
  Stream<List<ChatMessage>> watch({
    required String uid,
    required String chatId,
  });

  Future<ChatMessagesCacheInfo> info({
    required String uid,
    required String chatId,
  });

  /// Inserts new messages and replaces existing ones with the same id.
  Future<void> upsert({
    required String uid,
    required String chatId,
    required List<ChatMessage> messages,
  });

  Future<void> markReachedStart({
    required String uid,
    required String chatId,
  });
}
