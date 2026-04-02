import 'package:dartz/dartz.dart';

import '../../../../core/models/exceptions.dart';
import '../../../chat/domain/services/i_presence_service.dart';

import '../repostories/i_auth_repository.dart';

class SignInWithGoogleUseCase {
  final IAuthRepository _authRepository;
  final IPresenceService _presenceService;

  SignInWithGoogleUseCase({
    required IAuthRepository authRepository,
    required IPresenceService presenceService,
  }) : _authRepository = authRepository,
       _presenceService = presenceService;

  /// register if success Update UID of user .
  Future<Either<void, Exceptions>> call() async {
    final res = await _authRepository.signInWithGoogle();

    return res.fold(
      (_) async {
        await _presenceService.init();
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
