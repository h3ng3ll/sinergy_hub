import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/models/chat/chat.dart';

part 'chats_cache.freezed.dart';

/// Locally cached chat list of one signed-in user.
@freezed
sealed class ChatsCache with _$ChatsCache {
  const factory ChatsCache({
    @Default([]) List<Chat> chats,
  }) = _ChatsCache;
}
