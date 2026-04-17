import 'package:dartz/dartz.dart';

import '../../../../core/models/failures.dart';
import '../../../chat/domain/services/i_presence_service.dart';
import '../../../user/domain/models/user_data/user_data.dart';
import '../../../user/domain/repositories/i_user_repository.dart';
import '../repostories/i_auth_repository.dart';
import 'send_email_verification_use_case.dart';

class RegisterUseCase {
  final IAuthRepository _authRepository;
  final IUserRepository _userRepository;
  final SendEmailVerificationUseCase _sendEmailVerificationUseCase;
  final IPresenceService _presenceService;

  RegisterUseCase({
    required IAuthRepository authRepository,
    required IUserRepository userRepository,
    required SendEmailVerificationUseCase sendEmailVerificationUseCase,
    required IPresenceService presenceService,
  }) : _authRepository = authRepository,
       _userRepository = userRepository,
       _sendEmailVerificationUseCase = sendEmailVerificationUseCase,
       _presenceService = presenceService;

  /// register if success Update UID of user .
  Future<Either<void, Failure>> call({
    required String email,
    required String password,
  }) async {
    final res = await _authRepository.register(
      email: email,
      password: password,
    );
    if (res.isRight()) {
      return res;
    }
    final sendRes = await _sendEmailVerificationUseCase.call();

    if (sendRes.isRight()) {
      return res;
    }

    final user = await _userRepository.currentUserFuture();
    final uid = user!.uid;
    await _userRepository.update(
      userData: UserData.none().copyWith(
        uid: uid,
        createdAt: DateTime.now(),
      ),
    );

    await _presenceService.init();

    return Left(
      null,
    );
  }
}
