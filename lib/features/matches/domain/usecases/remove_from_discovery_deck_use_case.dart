import '../../../auth/domain/repostories/i_auth_repository.dart';
import '../repositories/i_discovery_deck_local_repository.dart';

/// Drops a swiped user from every cached deck of the current user.
class RemoveFromDiscoveryDeckUseCase {
  final IDiscoveryDeckLocalRepository _localRepository;
  final IAuthRepository _authRepository;

  RemoveFromDiscoveryDeckUseCase({
    required this._localRepository,
    required this._authRepository,
  });

  Future<void> call({
    required String userUid,
  }) async {
    final uid = await _authRepository.requireUserId();
    await _localRepository.removeUser(uid: uid, userUid: userUid);
  }
}
