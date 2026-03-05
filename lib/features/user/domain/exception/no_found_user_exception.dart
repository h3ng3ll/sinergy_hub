class NoFoundUserException implements Exception {
  final String message;

  NoFoundUserException({
    this.message = 'No User found',
  });
}
