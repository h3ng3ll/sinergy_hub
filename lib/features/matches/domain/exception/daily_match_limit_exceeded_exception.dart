import '../../../../core/models/exceptions.dart';

class DailyMatchLimitExceededException implements Exceptions {
  @override
  final String message;

  DailyMatchLimitExceededException({
    this.message =
        'You have reached your daily limit of free matches. Try again tomorrow',
  });
}
