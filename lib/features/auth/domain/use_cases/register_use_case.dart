import '../../../user/domain/models/user_data/user_data.dart';
import '../../../user/domain/repositories/i_user_repository.dart';
import '../repostories/i_auth_repository.dart';

class RegisterUseCase {
  final IAuthRepository _authRepository;
  final IUserRepository _userRepository;

  RegisterUseCase({
    required IAuthRepository authRepository,
    required IUserRepository userRepository,
  }) : _authRepository = authRepository,
       _userRepository = userRepository;

  /// register if success Update UID of user .
  Future<void> call({
    required String email,
    required String password,
  }) async {
    await _authRepository.register(
      email: email,
      password: password,
    );
    final user = await _userRepository.currentUserFuture();
    final uid = user!.uid;
    await _userRepository.update(
      userData: UserData.none().copyWith(
        uid: uid,
        createdAt: DateTime.now(),
      ),
    );
  }
}
