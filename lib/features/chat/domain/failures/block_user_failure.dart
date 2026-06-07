import '../../../../core/failures/failure.dart';

class BlockUserFailure implements Failure {
  @override
  String get message => 'Failed to update block status. Try again';
}
