import '../../../auth/domain/repostories/i_auth_repository.dart';
import '../repositories/i_matches_repository.dart';

class MarkAsNotifiedMatchUseCase {
  final IMatchesRepository _matchesRepository;
  final IAuthRepository _authRepository;

  MarkAsNotifiedMatchUseCase({
    required IMatchesRepository matchesRepository,
    required IAuthRepository authRepository,
  }) : _matchesRepository = matchesRepository,
       _authRepository = authRepository;

  Future<void> call(
    String matchId,
  ) async {
    final uid = await _authRepository.requireUserId();

    await _matchesRepository.markAsNotified(
      uid: uid,
      matchId: matchId,
    );
  }
}
