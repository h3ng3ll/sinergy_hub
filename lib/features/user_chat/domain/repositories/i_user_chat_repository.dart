abstract class IUserChatRepository {
  Future<void> create({
    required String uid,
    required String chatId,
  });

  Future<List<String>> getChatIds({
    required String uid,
  });
}
