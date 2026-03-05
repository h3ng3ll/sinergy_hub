class NoFoundChatException implements Exception {
  final String message;

  NoFoundChatException({
    this.message = 'No Chat found',
  });
}
