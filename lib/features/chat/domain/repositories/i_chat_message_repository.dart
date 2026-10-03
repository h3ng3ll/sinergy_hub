import '../models/chat_message/chat_message.dart';

/// Messages fetched per page from the backend.
const int kChatMessagesPageSize = 30;

abstract class IChatMessageRepository {
  Future<ChatMessage> create({
    required String chatId,
    required ChatMessage message,
  });

  Stream<List<ChatMessage>> getLastMessagesStream({
    required String uid,
    required String chatId,
  });

  /// Live changes of messages created at or after [after]. With a null
  /// [after] it streams the newest [kChatMessagesPageSize] messages.
  Stream<List<ChatMessage>> listenMessagesSince({
    required String chatId,
    DateTime? after,
  });

  /// One page of messages created strictly before [before], newest first.
  Future<List<ChatMessage>> fetchMessagesBefore({
    required String uid,
    required String chatId,
    required DateTime before,
    int limit = kChatMessagesPageSize,
  });
}
