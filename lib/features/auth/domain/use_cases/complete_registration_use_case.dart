import 'package:dartz/dartz.dart';

import '../../../chat/domain/services/i_presence_service.dart';
import '../failures/auth_failures.dart';
import '../failures/email_not_verified_failure.dart';
import '../repostories/i_auth_repository.dart';

class CompleteRegistrationUseCase {
  final IAuthRepository _authRepository;
  final IPresenceService _presenceService;

  CompleteRegistrationUseCase({
    required IAuthRepository authRepository,
    required IPresenceService presenceService,
  }) : _authRepository = authRepository,
       _presenceService = presenceService;

  /// Polls Firebase for verification status. When verified, initialises
  /// presence so the router gate (which reads AuthState.isAuthorized,
  /// requiring isEmailVerified) opens onboarding. The Firestore user
  /// document itself is created later, by OnboardAboutYouPage via
  /// UpdateUserUseCase — leaving it absent here is what keeps the
  /// router's isNoData onboarding redirect engaged.
  Future<Either<void, AuthFailure>> call() async {
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

    await _presenceService.init();

    return Left(
      null,
    );
  }
}
