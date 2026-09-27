import '../../../user/domain/models/users_data_pg_state/users_data_pg_state.dart';
import '../models/matches_filter/matches_filter.dart';

/// `searchNearbyCandidates` — Distance-mode search, see
/// `docs/location_backend_contract.md` §4. Runs entirely server-side because
/// only the backend holds coordinates.
abstract class INearbyCandidatesRepository {
  Future<UserDataPgState> search({
    required UserDataPgState userDataState,
    required MatchesFilter filter,
  });
}
