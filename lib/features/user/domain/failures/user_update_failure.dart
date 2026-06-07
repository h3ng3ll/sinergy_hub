import '../../../../core/failures/failure.dart';

abstract class UserFailure extends Failure {
  UserFailure(super.message);
}

class UserUpdateFailure implements UserFailure {
  @override
  String get message => 'Failed to update user profile. Try again';
}
class FailedDeleteAccount implements UserFailure {
  @override
  String get message => 'Failed delete account. Try again';
}
