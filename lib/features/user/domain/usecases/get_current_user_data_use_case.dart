import '../exception/no_found_user_exception.dart';
import '../models/user_data/user_data.dart';
import '../repositories/i_user_repository.dart';

class GetCurrentUserDataUseCase {
  final IUserRepository _userRepository;

  GetCurrentUserDataUseCase({
    required IUserRepository userRepository,
  }) : _userRepository = userRepository;

  Future<UserData> call() async {
    final user = await _userRepository.currentUserDataFuture();
    if (user == null) {
      throw NoFoundUserException();
    }
    return user;
  }
}
