class NoFoundKeywordsForSearchingException implements Exception {
  final String message;

  NoFoundKeywordsForSearchingException({
    this.message = 'No Found keywords for searching',
  });
}
