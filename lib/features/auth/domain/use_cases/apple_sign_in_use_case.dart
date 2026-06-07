import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/failures/failure.dart';
import '../models/apple_sign_in_result/apple_sign_in_result.dart';
import '../repostories/i_auth_repository.dart';
import '../repostories/i_auth_temp_credentials_repository.dart';
import 'authorization_use_case.dart';

class AppleSignInUseCase {
  final IAuthRepository _authRepository;
  final AuthorizationUseCase _authorizationUseCase;
  final IAuthTempCredentialsRepository _authTempCredentialsRepository;

  AppleSignInUseCase({
    required IAuthRepository authRepository,
    required AuthorizationUseCase authorizationUseCase,
    required IAuthTempCredentialsRepository authTempCredentialsRepository,
  }) : _authRepository = authRepository,
       _authorizationUseCase = authorizationUseCase,
       _authTempCredentialsRepository = authTempCredentialsRepository;

  Future<Either<UserCredential?, Failure>> call() async {
    final res = await _authRepository.signInWithApple();
    return res.fold(
      (AppleSignInResult result) async {
        // A provider only returns the name/email on the FIRST authorization —
        // cache it (overwriting any prior record) so onboarding can prefill it.
        // Skip when nothing was returned this time, to avoid clobbering a good
        // first-auth cache with empties.
        if (result.credentials.hasAny) {
          await _authTempCredentialsRepository.save(result.credentials);
        }

        if (result.userCredential != null) {
          await _authorizationUseCase();
        }
        return Left(result.userCredential);
      },
      (e) => Right(e),
    );
  }
}
