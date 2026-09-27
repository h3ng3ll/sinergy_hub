import '../../../auth/domain/repostories/i_auth_repository.dart';
import '../../../user/domain/models/user_data/user_data.dart';
import '../../../user/domain/models/users_data_pg_state/users_data_pg_state.dart';
import '../../../user/domain/repositories/i_user_read_repository.dart';
import '../models/e_location_filter_mode.dart';
import '../models/matches_filter/matches_filter.dart';
import '../repositories/i_candidate_distance_repository.dart';
import 'get_excluded_matches_use_case.dart';

class LookForMatchesUseCase {
  final IUserReadRepository _userReadRepository;
  final IAuthRepository _authRepository;
  final GetExcludedMatchesUseCase _getExcludedMatchesUseCase;
  final ICandidateDistanceRepository _candidateDistanceRepository;

  LookForMatchesUseCase({
    required IUserReadRepository userReadRepository,
    required IAuthRepository authRepository,
    required GetExcludedMatchesUseCase getExcludedMatchesUseCase,
    required ICandidateDistanceRepository candidateDistanceRepository,
  }) : _userReadRepository = userReadRepository,
       _authRepository = authRepository,
       _getExcludedMatchesUseCase = getExcludedMatchesUseCase,
       _candidateDistanceRepository = candidateDistanceRepository;

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

    // Radius-mode responses already embed distanceKm per item (§4). In
    // place mode / no filter, fetch it separately for whichever fetched
    // uids don't have a cached distance yet — non-fatal, per §3 "Client
    // handling": a failure here must never block the deck.
    if (filter?.locationMode != ELocationFilterMode.radius) {
      final uidsMissingDistance = userState.items
          .map((e) => e.uid)
          .where((uid) => !userState.distancesKm.containsKey(uid))
          .toList();

      if (uidsMissingDistance.isNotEmpty) {
        final fetchedDistances = await _candidateDistanceRepository
            .getDistances(uids: uidsMissingDistance);

        userState = userState.copyWith(
          distancesKm: {
            ...userState.distancesKm,
            for (final entry in fetchedDistances.entries)
              if (entry.value != null) entry.key: entry.value!,
          },
        );
      }
    }

    return userState;
  }
}
