import 'package:dartz/dartz.dart';

import '../../../../core/failures/failure.dart';
import '../failures/email_not_verified_failure.dart';
import '../repostories/i_auth_repository.dart';
import 'authorization_use_case.dart';

class LoginUseCase {
  final IAuthRepository _authRepository;
  final AuthorizationUseCase _authorizationUseCase;

  LoginUseCase({
    required IAuthRepository authRepository,
    required AuthorizationUseCase authorizationUseCase,
  })  : _authRepository = authRepository,
        _authorizationUseCase = authorizationUseCase;

  /// Signs in. An email that is not verified yet cannot pass the router gate
  /// (it requires `isEmailVerified`), so a verification link is sent and
  /// [EmailNotVerifiedFailure] is returned for the page to show its verify
  /// step; presence starts only once the address is verified.
  Future<Either<void, Failure>> call({
    required String email,
    required String password,
  }) async {
    final res = await _authRepository.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    return res.fold(
      (_) async {
        if (!await _authRepository.isEmailVerified()) {
          /// A failure here is usually rate limiting after a recent send —
          /// the user still gets the verify step and can resend later.
          await _authRepository.sendEmailVerification();
          return Right(
            const EmailNotVerifiedFailure(),
          );
        }
        await _authorizationUseCase();
        return Left(
          null,
        );
      },
      (e) {
        return Right(
          e,
        );
      },
    );
  }
}
