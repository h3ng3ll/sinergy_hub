import '../models/chat/chat.dart';

/// Local, per-user cache of the chat list.
abstract class IChatLocalRepository {
  /// Emits the cached chats right away, then on every change. Emits `null`
  /// while nothing has ever been cached for [uid], so callers can tell
  /// "not loaded yet" from "no chats".
  Stream<List<Chat>?> watch({
    required String uid,
  });

  /// Replaces the cached list with a complete backend snapshot.
  Future<void> replaceAll({
    required String uid,
    required List<Chat> chats,
  });
}
