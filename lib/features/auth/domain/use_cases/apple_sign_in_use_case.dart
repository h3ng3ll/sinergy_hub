
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/models/failures.dart';

import '../repostories/i_auth_repository.dart';
import 'authorization_use_case.dart';

class AppleSignInUseCase {
  final IAuthRepository _authRepository;
  final AuthorizationUseCase _authorizationUseCase;

  AppleSignInUseCase({
    required IAuthRepository authRepository,
    required AuthorizationUseCase authorizationUseCase,
  })  : _authRepository = authRepository,
        _authorizationUseCase = authorizationUseCase;


  Future<Either<UserCredential?, Failure>> call() async {
    final res = await _authRepository.signInWithApple();
    return res.fold(
      (credential) async {
        if (credential != null) {
          await _authorizationUseCase();
        }
        return Left(credential);
      },
      (e) => Right(e),
    );
  }
}
