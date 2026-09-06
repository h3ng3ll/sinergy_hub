import 'auth_failures.dart';

class UnauthorizedFailure implements AuthFailure {
  @override
  final String message;

  UnauthorizedFailure({
    this.message = 'Canceled',
  });
}
