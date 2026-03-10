import '../../../auth/domain/repostories/i_auth_repository.dart';
import '../../../user/domain/models/users_data_pg_state/users_data_pg_state.dart';
import '../../../user/domain/repositories/i_user_repository.dart';
import '../../../user/domain/models/user_data/user_data.dart';
import 'get_excluded_matches_use_case.dart';

class LookForMatchesUseCase {
  final IUserRepository _userRepository;
  final IAuthRepository _authRepository;
  final GetExcludedMatchesUseCase _getExcludedMatchesUseCase;

  LookForMatchesUseCase({
    required IUserRepository userRepository,
    required IAuthRepository authRepository,
    required GetExcludedMatchesUseCase getExcludedMatchesUseCase,
  }) : _userRepository = userRepository,
       _authRepository = authRepository,
       _getExcludedMatchesUseCase = getExcludedMatchesUseCase;

  /// fetch users and exclude already matched people if it
  /// found include current user
  Future<List<UserData>> call() async {
    final uid = await _authRepository.requireUserId();
    final excludedUids = await _getExcludedMatchesUseCase.call();
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
