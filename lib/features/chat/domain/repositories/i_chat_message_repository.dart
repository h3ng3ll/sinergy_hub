import '../models/chat_message/chat_message.dart';

abstract class IChatMessageRepository {
  Future<ChatMessage> create({
    required String chatId,
    required ChatMessage message,
  });
  Stream<List<ChatMessage>>  getLastMessagesStream({
    required String uid,
    required String chatId,
  });
}
