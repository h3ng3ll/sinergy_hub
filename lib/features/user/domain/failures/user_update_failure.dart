import '../../../../core/models/failures.dart';

class UserUpdateFailure implements Failure {
  @override
  String get message => 'Failed to update user profile. Try again';
}
