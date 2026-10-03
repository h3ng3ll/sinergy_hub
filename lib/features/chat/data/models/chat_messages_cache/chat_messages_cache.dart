import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/models/chat_message/chat_message.dart';

part 'chat_messages_cache.freezed.dart';

/// Locally cached messages of one chat for one signed-in user.
///
/// [messages] are kept sorted by `createdAt` ascending and unique by id.
/// [reachedStart] is true once the very first message of the conversation is
/// in the cache, so no older page is ever requested again.
@freezed
sealed class ChatMessagesCache with _$ChatMessagesCache {
  const factory ChatMessagesCache({
    required String chatId,
    @Default([]) List<ChatMessage> messages,
    @Default(false) bool reachedStart,
  }) = _ChatMessagesCache;
}
