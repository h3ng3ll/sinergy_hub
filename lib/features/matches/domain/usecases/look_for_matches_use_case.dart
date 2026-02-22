import '../../../auth/domain/repostories/i_auth_repository.dart';
import '../../../user/domain/models/users_data_pg_state/users_data_pg_state.dart';
import '../../../user/domain/repositories/i_user_repository.dart';
import '../../../user/domain/models/user_data/user_data.dart';
import '../repositories/i_user_matching_out_repository.dart';

class LookForMatchesUseCase {
  final IUserRepository _userRepository;
  final IAuthRepository _authRepository;
  final IUserMatchingOutRepository _matchingOutRepository;

  LookForMatchesUseCase({
    required IUserRepository userRepository,
    required IAuthRepository authRepository,
    required IUserMatchingOutRepository matchingOutRepository,
  }) : _userRepository = userRepository,
       _matchingOutRepository = matchingOutRepository,
       _authRepository = authRepository;

  /// fetch users and exclude already matched people if it
  /// found include current user
  Future<List<UserData>> call() async {
    final uid = await _authRepository.requireUserId();
    final excludedUids = await _matchingOutRepository.getUids(
      uid: uid,
    );
    final userDataState = UserDataPgState(
      excludedUids: {
        uid,
        ...excludedUids,
      },
    );
    return await _userRepository.get(
      userDataState: userDataState,
    );
  }
}
