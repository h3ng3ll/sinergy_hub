import 'auth_failures.dart';

class SomethingWentWrongSignInFailure implements AuthFailure {
  @override
  final String message;

  SomethingWentWrongSignInFailure({
    this.message = 'Something went wrong . Try again',
  });
}
