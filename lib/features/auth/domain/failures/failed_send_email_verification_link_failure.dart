import '../../../../core/models/exceptions.dart';
import 'auth_failures.dart';

class AuthUnreachableFailure implements AuthFailure {
  @override
  final String message;

  AuthUnreachableFailure({
    this.message = 'Failed send verification email . Try again later',
  });
}
