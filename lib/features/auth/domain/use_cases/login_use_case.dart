import 'package:dartz/dartz.dart';

import '../../../../core/models/failures.dart';
import '../../../user/domain/models/user_data/user_data.dart';
import '../../../user/domain/repositories/i_user_repository.dart';
import '../repostories/i_auth_repository.dart';

class LoginUseCase {
  final IAuthRepository _authRepository;

  LoginUseCase({
    required IAuthRepository authRepository,
  }) : _authRepository = authRepository;

  /// register if success Update UID of user .
  Future<Either<void, Failure>> call({
    required String email,
    required String password,
  }) async {
    return  await _authRepository.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }
}
