import '../../domain/models/chat/chat.dart';
import '../../domain/models/chat_config/chat_config.dart';

extension ChatListConfigExt on List<Chat> {
  List<Chat> applyConfigs(List<ChatConfig> configs) {
    final configMap = {
      for (var config in configs) config.chatId: config,
    };

    return map((chat) {
      final config = configMap[chat.chatId];
      if (config != null) {
        return chat.copyWith(
          isArchived: config.archived,
          isFavorite: config.favorite,
        );
      }
      return chat;
    }).toList();
  }
}