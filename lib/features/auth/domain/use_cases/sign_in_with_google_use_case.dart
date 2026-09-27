import 'package:dartz/dartz.dart';

import '../../../../core/models/exceptions.dart';
import '../repostories/i_auth_repository.dart';
import 'authorization_use_case.dart';

class SignInWithGoogleUseCase {
  final IAuthRepository _authRepository;
  final AuthorizationUseCase _authorizationUseCase;

  SignInWithGoogleUseCase({
    required this._authRepository,
    required this._authorizationUseCase,
  });

  /// register if success Update UID of user .
  Future<Either<void, Exceptions>> call() async {
    final res = await _authRepository.signInWithGoogle();

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
