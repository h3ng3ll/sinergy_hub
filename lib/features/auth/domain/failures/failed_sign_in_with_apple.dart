import 'auth_failures.dart';

class FailedSignInWithApple implements AuthFailure {
  @override
  final String message;

  FailedSignInWithApple({
    this.message = ' Apple Sign-In failed',
  });
}
