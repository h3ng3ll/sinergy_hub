import 'package:dartz/dartz.dart';

import '../failures/auth_failures.dart';
import '../failures/email_not_verified_failure.dart';
import '../failures/unauthorized_failure.dart';
import '../repostories/i_auth_repository.dart';
import 'authorization_use_case.dart';

class CompleteRegistrationUseCase {
  final IAuthRepository _authRepository;
  final AuthorizationUseCase _authorizationUseCase;

  CompleteRegistrationUseCase({
    required IAuthRepository authRepository,
    required AuthorizationUseCase authorizationUseCase,
  })  : _authRepository = authRepository,
        _authorizationUseCase = authorizationUseCase;

  /// Polls Firebase for verification status. When verified, initialises
  /// presence so the router gate (which reads AuthState.isAuthorized,
  /// requiring isEmailVerified) opens onboarding. The Firestore user
  /// document itself is created later, by OnboardAboutYouPage via
  /// UpdateUserUseCase — leaving it absent here is what keeps the
  /// router's isNoData onboarding redirect engaged.
  Future<Either<void, AuthFailure>> call() async {
    /// The sign-in from register() can be gone by the time the user returns
    /// from the email link (process killed, session dropped). reload() is a
    /// silent no-op then, so without this check polling never ends.
    if (await _authRepository.getCurrentUser() == null) {
      return Right(
        UnauthorizedFailure(),
      );
    }

    final reloadRes = await _authRepository.reload();
    if (reloadRes.isRight()) {
      return reloadRes;
    }

    final verified = await _authRepository.isEmailVerified();
    if (!verified) {
      return Right(
        const EmailNotVerifiedFailure(),
      );
    }

    await _authorizationUseCase();

    return Left(
      null,
    );
  }
}
