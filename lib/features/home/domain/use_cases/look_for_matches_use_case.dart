import '../../../user/domain/models/users_data_pg_state/users_data_pg_state.dart';
import '../../../user/domain/repositories/i_user_repository.dart';
import '../../../user/domain/models/user_data/user_data.dart';

class LookForMatchesUseCase {
  final IUserRepository userRepository;

  LookForMatchesUseCase({
    required this.userRepository,
  });

  Future<List<UserData>> call({
    required UserDataPgState userDataState,
  }) async {
    return userRepository.get(
      userDataState: userDataState,
    );
  }
}
