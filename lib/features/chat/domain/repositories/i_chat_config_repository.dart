import '../models/chat_config/chat_config.dart';

abstract class IChatConfigRepository {
  /// Get chat configuration for a specific user and chat
  Future<ChatConfig?> getConfig({
    required String uid,
    required String chatId,
  });

  /// Stream chat configurations for a specific user
  Stream<List<ChatConfig>> getConfigsStream(
    String uid,
  );

  Future<List<ChatConfig>> getConfigs({
   required String uid,
  });

  /// Update or create chat configuration
  Future<void> updateConfig({
    required String uid,
    required ChatConfig config,
  });
}
