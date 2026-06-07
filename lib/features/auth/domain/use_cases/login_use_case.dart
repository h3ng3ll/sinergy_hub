import 'package:dartz/dartz.dart';

import '../../../../core/failures/failure.dart';
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

  /// register if success Update UID of user .
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
