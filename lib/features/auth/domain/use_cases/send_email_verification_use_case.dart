import 'package:dartz/dartz.dart';

import '../../../../core/models/exceptions.dart';
import '../../../chat/domain/services/i_presence_service.dart';

import '../failures/auth_failures.dart';
import '../repostories/i_auth_repository.dart';

class SendEmailVerificationUseCase {
  final IAuthRepository _authRepository;


  SendEmailVerificationUseCase({
    required IAuthRepository authRepository,
    required IPresenceService presenceService,
  }) : _authRepository = authRepository;

  Future<Either<void, AuthFailure>> call() async {
    final res = await _authRepository.sendEmailVerification();

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
