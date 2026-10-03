import '../models/chat/chat.dart';
import '../models/e_chat_filter.dart';

/// Applies the chat-list filter and search query locally, on cached chats.
/// Newest conversation first.
class FilterChatsUseCase {
  List<Chat> call({
    required List<Chat> chats,
    required String uid,
    required EChatFilter filter,
    required String query,
  }) {
    final normalizedQuery = query.trim().toLowerCase();

    return chats.where((chat) {
        final matchesFilter = switch (filter) {
          EChatFilter.favorite => chat.isFavorite(uid),
          EChatFilter.archived => chat.isArchived(uid),
          EChatFilter.recent || EChatFilter.unread || EChatFilter.all => true,
        };
        if (!matchesFilter) return false;
        if (normalizedQuery.isEmpty) return true;
        return chat.searchKeywords.any(
          (keyword) => keyword.toLowerCase() == normalizedQuery,
        );
      }).toList()
      ..sort(
        (a, b) => b.lastMessageSent.compareTo(a.lastMessageSent),
      );
  }
}
