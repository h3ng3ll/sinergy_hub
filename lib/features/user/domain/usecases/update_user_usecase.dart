import '../models/user_data/user_data.dart';
import '../repositories/i_user_repository.dart';

class UpdateUserUseCase {
  final IUserRepository _userRepository;

  UpdateUserUseCase({
    required IUserRepository userRepository,
  }) : _userRepository = userRepository;

  Future<void> call(UserData userData) async {
    return _userRepository.update(
      userData: userData,
    );
  }
}
