import '../../../auth/domain/repostories/i_auth_repository.dart';
import '../exception/no_found_user_exception.dart';
import '../models/user_data/user_data.dart';
import '../repositories/i_user_read_repository.dart';

class GetCurrentUserDataUseCase {
  final IUserReadRepository _userReadRepository;
  final IAuthRepository _authRepository;

  GetCurrentUserDataUseCase({
    required IUserReadRepository userReadRepository,
    required IAuthRepository authRepository,
  }) : _userReadRepository = userReadRepository,
       _authRepository = authRepository;

  Future<UserData> call() async {
    final uid = await _authRepository.requireUserId();

    final user = await _userReadRepository.getUserById(
      id: uid,
    );
    if (user == null) {
      throw NoFoundUserException();
    }
    return user;
  }
}
