import '../models/user_data/user_data.dart';
import '../repositories/i_user_read_repository.dart';

class GetUserDataUseCase {
  final IUserReadRepository _userReadRepository;

  GetUserDataUseCase({
    required IUserReadRepository userReadRepository,
  }) : _userReadRepository = userReadRepository;

  Future<UserData?> call({
    required String id,
  }) async {
    return await _userReadRepository.getUserById(
      id: id,
    );
  }
}
