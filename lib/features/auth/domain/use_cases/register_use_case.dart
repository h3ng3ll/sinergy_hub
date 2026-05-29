import 'package:dartz/dartz.dart';

import '../failures/auth_failures.dart';
import '../repostories/i_auth_repository.dart';

class RegisterUseCase {
  final IAuthRepository _authRepository;

  RegisterUseCase({
    required IAuthRepository authRepository,
  }) : _authRepository = authRepository;

  /// Creates the Firebase auth user. The verification email is sent by the
  /// repository's [IAuthRepository.register] on the freshly created user,
  /// so it is guaranteed to be sent on the first registration. Subsequent
  /// resends go through [SendEmailVerificationUseCase].
  /// Firestore persistence + presence init happen later in
  /// CompleteRegistrationUseCase, after the user verifies their email.
  Future<Either<void, AuthFailure>> call({
    required String email,
    required String password,
  }) async {
    return _authRepository.register(
      email: email,
      password: password,
    );
  }
}
