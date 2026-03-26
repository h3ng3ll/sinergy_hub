import '../../../../core/models/exceptions.dart';
import 'auth_failures.dart';

class SuchUserNotExistsFailure implements AuthFailure {
  @override
  final String message;

  SuchUserNotExistsFailure({
    this.message = 'Such user not exists.',
  });
}
