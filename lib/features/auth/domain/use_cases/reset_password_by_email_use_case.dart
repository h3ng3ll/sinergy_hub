import 'package:dartz/dartz.dart';

import '../../../../core/models/exceptions.dart';
import '../../../chat/domain/services/i_presence_service.dart';

import '../failures/auth_failures.dart';
import '../repostories/i_auth_repository.dart';

class ResetPasswordByEmailUseCase {
  final IAuthRepository _authRepository;

  ResetPasswordByEmailUseCase({
    required IAuthRepository authRepository,
  }) : _authRepository = authRepository;

  Future<Either<void, AuthFailure>> call(
    String email,
  ) async {
    final res = await _authRepository.sendPasswordResetEmail(
      email: email,
    );

    return res.fold(
      (_) async {
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
