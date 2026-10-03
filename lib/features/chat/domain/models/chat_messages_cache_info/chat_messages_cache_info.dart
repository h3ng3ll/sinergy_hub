/// Bounds of the locally cached history of a chat.
class ChatMessagesCacheInfo {
  final DateTime? oldestCreatedAt;
  final DateTime? latestCreatedAt;
  final bool reachedStart;

  const ChatMessagesCacheInfo({
    required this.oldestCreatedAt,
    required this.latestCreatedAt,
    required this.reachedStart,
  });

  bool get isEmpty => latestCreatedAt == null;
}
