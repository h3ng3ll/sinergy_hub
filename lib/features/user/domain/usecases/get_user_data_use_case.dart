import '../models/user_data/user_data.dart';
import '../repositories/i_user_repository.dart';

class GetUserDataUseCase {
  final IUserRepository _userRepository;

  GetUserDataUseCase({
    required IUserRepository userRepository,
  }) : _userRepository = userRepository;

  Future<UserData?> call({
    required String id,
  }) async {
    return await _userRepository.getUserById(
      id: id,
    );
  }
}
