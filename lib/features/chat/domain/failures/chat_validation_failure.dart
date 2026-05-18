import '../../../../core/models/failures.dart';

class ChatValidationFailure implements Failure {
  @override
  final String message;

  const ChatValidationFailure([
    this.message = 'Chat is not valid',
  ]);
}
