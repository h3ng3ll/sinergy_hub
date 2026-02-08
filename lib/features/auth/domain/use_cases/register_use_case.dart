import '../repostories/i_auth_repository.dart';

class RegisterUseCase {
  final IAuthRepository _authRepository;

  RegisterUseCase({
    required IAuthRepository authRepository,
  }) : _authRepository = authRepository;

  Future<void> call({
    required String email,
    required String password,
  }) async {
    return await _authRepository.register(
      email: email,
      password: password,
    );
  }
}
