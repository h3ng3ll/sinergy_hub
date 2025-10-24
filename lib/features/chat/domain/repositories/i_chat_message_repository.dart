import '../models/chat/chat.dart';
import '../models/chat_message/chat_message.dart';

abstract class IChatMessageRepository {
  Future<void> create({
    required ChatMessage message,
  });
}
