import '../../../auth/domain/repostories/i_auth_repository.dart';
import '../../../user/domain/models/user_data/user_data.dart';
import '../../../user/domain/models/users_data_pg_state/users_data_pg_state.dart';
import '../models/matches_filter/matches_filter.dart';
import '../repositories/i_discovery_deck_local_repository.dart';
import 'get_excluded_matches_use_case.dart';

/// The cached deck for [MatchesFilter], minus users answered since it was
/// saved (e.g. from Liked you). Only the cheap matches query runs — the
/// users query and the distances callable are skipped entirely.
///
/// `null` when nothing usable is cached, so the caller fetches fresh.
class GetCachedDiscoveryDeckUseCase {
  final IDiscoveryDeckLocalRepository _localRepository;
  final GetExcludedMatchesUseCase _getExcludedMatchesUseCase;
  final IAuthRepository _authRepository;

  GetCachedDiscoveryDeckUseCase({
    required this._localRepository,
    required this._getExcludedMatchesUseCase,
    required this._authRepository,
  });

  Future<UserDataPgState?> call({
    required MatchesFilter filter,
  }) async {
    final uid = await _authRepository.requireUserId();
    final cached = await _localRepository.get(uid: uid, filter: filter);
    if (cached == null) return null;

    final excludedUids = await _excludedUids();
    final items = cached.items
        .where((u) => u.uid != uid && !excludedUids.contains(u.uid))
        .whereActive()
        .toList();
    if (items.isEmpty) return null;

    return cached.copyWith(items: items);
  }

  /// A failed check must not cost the user the cached deck — swiping an
  /// already-answered user is handled by the backend anyway.
  Future<Set<String>> _excludedUids() async {
    try {
      return (await _getExcludedMatchesUseCase.call()).toSet();
    } catch (_) {
      return const {};
    }
  }
}
