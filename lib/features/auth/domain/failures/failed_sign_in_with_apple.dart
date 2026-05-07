import '../../../../core/models/exceptions.dart';
import 'auth_failures.dart';

class FailedSignInWithApple implements AuthFailure {
  @override
  final String message;

  FailedSignInWithApple({
    this.message = 'iOS Apple Sign-In failed',
  });
}
