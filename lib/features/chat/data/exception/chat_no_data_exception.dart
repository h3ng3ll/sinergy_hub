class ChatNoDataException implements Exception {
  final String message;

  ChatNoDataException({
    this.message = 'No Found data for chat',
  });
}
