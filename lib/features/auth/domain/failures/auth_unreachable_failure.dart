import 'auth_failures.dart';

class AuthUnreachableFailure implements AuthFailure {
  @override
  final String message;

  AuthUnreachableFailure({
    this.message = 'Server unreachable . Try again later',
  });
}
