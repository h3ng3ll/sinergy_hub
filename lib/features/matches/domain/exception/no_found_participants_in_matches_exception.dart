class NoFoundParticipantsInMatchesException implements Exception {
  final String message;

  NoFoundParticipantsInMatchesException({
    this.message = 'No participants found in matches',
  });
}