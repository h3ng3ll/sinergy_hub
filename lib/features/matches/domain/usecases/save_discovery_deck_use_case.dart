import '../../../auth/domain/repostories/i_auth_repository.dart';
import '../../../user/domain/models/users_data_pg_state/users_data_pg_state.dart';
import '../models/matches_filter/matches_filter.dart';
import '../repositories/i_discovery_deck_local_repository.dart';

class SaveDiscoveryDeckUseCase {
  final IDiscoveryDeckLocalRepository _localRepository;
  final IAuthRepository _authRepository;

  SaveDiscoveryDeckUseCase({
    required this._localRepository,
    required this._authRepository,
  });

  Future<void> call({
    required MatchesFilter filter,
    required UserDataPgState deck,
  }) async {
    final uid = await _authRepository.requireUserId();
    await _localRepository.save(uid: uid, filter: filter, deck: deck);
  }
}
