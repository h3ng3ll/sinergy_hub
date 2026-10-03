import '../../../../core/failures/failure.dart';

class LoadMessagesFailure extends Failure {
  const LoadMessagesFailure() : super('Failed to load messages. Try again');
}
