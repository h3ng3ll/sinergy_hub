import '../../../../core/models/failures.dart';
import 'auth_failures.dart';

class UserExistsWithSuchEmailFailure extends AuthFailure {
  const UserExistsWithSuchEmailFailure({
    super.message = 'User exists with such email',
  });
}
