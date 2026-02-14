import '../../../../core/models/failures.dart';

class AuthFailure extends Failure {
  const AuthFailure() : super('User not authenticated');
}