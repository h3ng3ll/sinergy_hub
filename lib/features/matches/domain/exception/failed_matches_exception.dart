import '../../../../core/models/exceptions.dart';

class NoFoundParticipantsInMatchesException implements Exceptions {
  @override
  final String message;

  NoFoundParticipantsInMatchesException({
    this.message = 'Something went wrong . no matches has occur',
  });
}