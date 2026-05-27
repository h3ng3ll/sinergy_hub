import '../repostories/i_auth_repository.dart';

class LogoutUseCase {
  final IAuthRepository _authRepository;

  LogoutUseCase({
    required IAuthRepository authRepository,
  }) : _authRepository = authRepository;

  Future<void> call() async {
    await _authRepository.signOut();
  }
}
