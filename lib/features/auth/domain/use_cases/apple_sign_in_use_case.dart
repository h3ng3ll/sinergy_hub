
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/models/failures.dart';

import '../repostories/i_auth_repository.dart';

class AppleSignInUseCase {
  final IAuthRepository _authRepository;

  AppleSignInUseCase({
    required IAuthRepository authRepository,
  }) : _authRepository = authRepository;


  Future<Either<UserCredential?, Failure>> call() async {
    return _authRepository.signInWithApple();
  }
}
