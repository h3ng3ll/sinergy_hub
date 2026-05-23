import 'package:dartz/dartz.dart';

import '../failures/auth_failures.dart';
import '../repostories/i_auth_repository.dart';
import 'send_email_verification_use_case.dart';

class RegisterUseCase {
  final IAuthRepository _authRepository;
  final SendEmailVerificationUseCase _sendEmailVerificationUseCase;

  RegisterUseCase({
    required IAuthRepository authRepository,
    required SendEmailVerificationUseCase sendEmailVerificationUseCase,
  }) : _authRepository = authRepository,
       _sendEmailVerificationUseCase = sendEmailVerificationUseCase;

  /// Creates the Firebase auth user and sends a verification email.
  /// Firestore persistence + presence init happen later in
  /// CompleteRegistrationUseCase, after the user verifies their email.
  Future<Either<void, AuthFailure>> call({
    required String email,
    required String password,
  }) async {
    final res = await _authRepository.register(
      email: email,
      password: password,
    );
    if (res.isRight()) {
      return res;
    }
    return _sendEmailVerificationUseCase.call();
  }
}
