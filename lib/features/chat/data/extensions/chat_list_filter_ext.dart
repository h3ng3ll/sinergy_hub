import '../../domain/models/chat/chat.dart';
import '../../domain/models/e_chat_filter.dart';
import '../models/chat_dto/chat_dto.dart';

extension ChatListFilterExt on List<ChatDto> {
  List<ChatDto> filterBy(EChatFilter filter) {
    switch (filter) {
      case EChatFilter.all:
        return where((c) => !c.isArchived).toList();

      case EChatFilter.archived:
        return where((c) => c.isArchived).toList();

      case EChatFilter.favorite:
        return where((c) => c.isFavorite && !c.isArchived).toList();

      case EChatFilter.unread:
        return where((c) => !c.hasRead && !c.isArchived).toList();

      case EChatFilter.recent:
        final sorted = List<ChatDto>.from(
          where((c) => !c.isArchived),
        );
        sorted.sort((a, b) => b.lastMessageSent.compareTo(a.lastMessageSent));
        return sorted;
    }
  }
}