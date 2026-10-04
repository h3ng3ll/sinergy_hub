import '../../../user/domain/models/users_data_pg_state/users_data_pg_state.dart';
import '../models/matches_filter/matches_filter.dart';

/// Local, per-user cache of the not-yet-swiped discovery deck, one entry per
/// filter.
abstract class IDiscoveryDeckLocalRepository {
  Future<UserDataPgState?> get({
    required String uid,
    required MatchesFilter filter,
  });

  /// Saves [deck] for [filter]. An empty deck deletes the entry, so the next
  /// load fetches a fresh one.
  Future<void> save({
    required String uid,
    required MatchesFilter filter,
    required UserDataPgState deck,
  });

  /// Removes [userUid] from every cached deck of [uid] — a swiped user must
  /// never come back under any filter.
  Future<void> removeUser({
    required String uid,
    required String userUid,
  });
}
