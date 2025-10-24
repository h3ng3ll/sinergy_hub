import '../../data/models/chat_dto/chat_dto.dart';
import '../models/chat/chat.dart';

abstract class IChatRepository {
  Future<void> create(Chat chat);

  /// Receive chats which participate
  /// to specify [uid]
  Stream<List<ChatDto>> get(String uid);
}
