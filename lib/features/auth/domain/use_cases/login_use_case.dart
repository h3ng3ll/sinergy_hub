import 'package:dartz/dartz.dart';

import '../../../../core/models/failures.dart';
import '../../../chat/domain/services/i_presence_service.dart';
import '../../../user/domain/models/user_data/user_data.dart';
import '../../../user/domain/repositories/i_user_repository.dart';
import '../repostories/i_auth_repository.dart';

class LoginUseCase {
  final IAuthRepository _authRepository;
  final IPresenceService _presenceService;

  LoginUseCase({
    required IAuthRepository authRepository,
    required IPresenceService presenceService,
  }) : _authRepository = authRepository,
       _presenceService = presenceService;

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
