import '../../../../core/models/exceptions.dart';

class MaxTriesExceededException implements Exceptions {
  @override
  final String message;

  MaxTriesExceededException({
    this.message = 'Failed to sign in after 3 attempts',
  });
}
