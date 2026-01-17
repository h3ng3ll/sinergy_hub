import '../../data/models/chat_dto/chat_dto.dart';
import '../models/chat/chat.dart';

abstract class IChatRepository {
  Future<Chat> create(Chat chat);

  /// Receive chats which participate
  /// to specify [uid]
  Stream<List<ChatDto>> getStream(String uid);

  Stream<ChatDto> getByIdStream({
    required String uid,
    required String chatId,
  });

  Future<void> update({
    required ChatDto chat,
  });
}
