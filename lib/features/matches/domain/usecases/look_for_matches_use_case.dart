import '../../../auth/domain/repostories/i_auth_repository.dart';
import '../../../user/domain/models/user_data/user_data.dart';
import '../../../user/domain/models/users_data_pg_state/users_data_pg_state.dart';
import '../../../user/domain/repositories/i_user_read_repository.dart';
import '../models/matches_filter/matches_filter.dart';
import 'get_excluded_matches_use_case.dart';

class LookForMatchesUseCase {
  final IUserReadRepository _userReadRepository;
  final IAuthRepository _authRepository;
  final GetExcludedMatchesUseCase _getExcludedMatchesUseCase;

  LookForMatchesUseCase({
    required IUserReadRepository userReadRepository,
    required IAuthRepository authRepository,
    required GetExcludedMatchesUseCase getExcludedMatchesUseCase,
  }) : _userReadRepository = userReadRepository,
       _authRepository = authRepository,
       _getExcludedMatchesUseCase = getExcludedMatchesUseCase;

  /// fetch users and exclude already matched people if it
  /// found include current user
  Future<UserDataPgState> call({
    required UserDataPgState userDataState,
    MatchesFilter? filter,
  }) async {
    final uid = await _authRepository.requireUserId();

    List<String> excludedUids = await _getExcludedMatchesUseCase.call()
      ..add(
        uid,
      );

    UserDataPgState userState = await _userReadRepository.get(
      userDataState: userDataState,
      filter: filter,
    );

    userState = userState.copyWith(
      items: userState.items
          .where(
            (e) => !excludedUids.contains(
              e.uid,
            ),
          )
          .whereActive()
          .toList(),
    );

    return userState;
  }
}
