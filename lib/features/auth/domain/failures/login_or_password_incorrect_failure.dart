import '../../../../core/models/exceptions.dart';
import 'auth_failures.dart';

class LoginOrPasswordIncorrectFailure implements AuthFailure {
  @override
  final String message;

  LoginOrPasswordIncorrectFailure({
    this.message = 'Login or password incorrect. Try again',
  });
}
