import '../../data/models/chat_dto/chat_dto.dart';
import '../models/chat/chat.dart';

abstract class IChatRepository {
  Future<Chat> create(Chat chat);

  /// Receive chats which participate
  /// to specify [uid]
  Stream<List<ChatDto>> getStream(String uid);

  Stream<ChatDto> listenByIdStream({
    required String uid,
    required String chatId,
  });

  Future<ChatDto> getById({
    required String chatId,
  });

  Future<void> update({
    required ChatDto chat,
  });

  Future<List<Chat>> search({
    required String uid,
    required String query,
  });
}
