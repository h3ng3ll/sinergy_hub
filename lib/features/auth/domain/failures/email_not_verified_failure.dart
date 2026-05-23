import 'auth_failures.dart';

class EmailNotVerifiedFailure implements AuthFailure {
  @override
  final String message;

  const EmailNotVerifiedFailure({
    this.message = 'Email is not verified yet',
  });
}
