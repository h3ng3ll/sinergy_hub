
import 'package:dartz/dartz.dart';

import '../../../../core/failures/failure.dart';
import '../../../../core/failures/uknown_failure.dart';
import '../../../auth/domain/repostories/i_auth_repository.dart';


class DeleteAccountUseCase {
  final IAuthRepository _authRepository;

  DeleteAccountUseCase({
    required IAuthRepository authRepository,
  }) : _authRepository = authRepository;

  Future<Either<Failure, void>> call() async {
    try {
      await _authRepository.deleteAccount();
      return Right(null);
    } catch (_) {
      return Left(
        UnknownFailure(),
      );
    }
  }
}
