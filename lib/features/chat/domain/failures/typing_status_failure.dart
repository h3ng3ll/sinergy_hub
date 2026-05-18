import '../../../../core/models/failures.dart';

class TypingStatusFailure implements Failure {
  @override
  final String message;

  const TypingStatusFailure([
    this.message = 'Failed to update typing status',
  ]);
}
