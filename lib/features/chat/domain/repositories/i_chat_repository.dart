import '../../data/models/chat_dto/chat_dto.dart';
import '../../data/models/chat_dto_pg_state.dart/chat_dto_pg_state.dart';
import '../models/chat/chat.dart';
import '../models/chat_config/chat_config.dart';
import '../models/chat_pg_state.dart/chat_pg_state.dart';
import '../models/e_chat_filter.dart';

abstract class IChatRepository {
  Future<Chat> create(
    Chat chat,
    String uid,
  );

  /// Receive chats which participate
  /// to specify [uid]
  Stream<List<Chat>> getStream(String uid);

  Stream<Chat> listenByIdStream({
    required String uid,
    required String chatId,
  });

  /// return lastly updated Chat
  Stream<Chat> chatUpdates({
    required String uid,
  });

  Future<Chat> getById({
    required String uid,
    required String chatId,
  });

  Future<void> update({
    required ChatDto chat,
  });

  Future<void> updateTypeInfo({
    required String uid,
    required String chatId,
    required bool isTyping,
  });

  Future<ChatPgState> get({
    required String uid,
    required ChatPgState chatState,
    String? query,
    EChatFilter filter = EChatFilter.all,
  });

  /// must return if specified uid contain
  /// in the chat to determine if it already exists  @override
  Future<Chat?> chatByParticipates({
    required String uid,
    required List<String> participates,
  });

  /// Update or create chat configuration
  Future<void> updateConfig({
    required String uid,
    required String chatId,
    required ChatConfig config,
  });

  Future<ChatConfig> getConfig({
    required String uid,
    required String chatId,
  });
}
