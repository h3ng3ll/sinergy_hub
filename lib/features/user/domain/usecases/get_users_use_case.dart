import '../../../auth/domain/repostories/i_auth_repository.dart';
import '../models/user_data/user_data.dart';
import '../repositories/i_user_read_repository.dart';

class GetUsersUseCase {
  final IUserReadRepository _userReadRepository;
  final IAuthRepository _authRepository;

  GetUsersUseCase({
    required IUserReadRepository userReadRepository,
    required IAuthRepository authRepository,
  }) : _userReadRepository = userReadRepository,
       _authRepository = authRepository;

  Future<List<UserData>> call({
    required List<String> ids,
  }) async {
    final uid = await _authRepository.requireUserId();

    return await _userReadRepository.getUsersById(
      ids: [...ids]
        ..remove(
          uid,
        ),
    );
  }
}
