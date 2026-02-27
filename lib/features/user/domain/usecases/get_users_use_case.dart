import '../../../auth/domain/repostories/i_auth_repository.dart';
import '../models/user_data/user_data.dart';
import '../repositories/i_user_repository.dart';

class GetUsersUseCase {
  final IUserRepository _userRepository;
  final IAuthRepository _authRepository;

  GetUsersUseCase({
    required IUserRepository userRepository,
    required IAuthRepository authRepository,
  }) : _userRepository = userRepository,
       _authRepository = authRepository;

  Future<List<UserData>> call({
    required List<String> ids,
  }) async {
    final uid = await _authRepository.requireUserId();

    return await _userRepository.getUsersById(
      ids: [...ids]
        ..remove(
          uid,
        ),
    );
  }
}
