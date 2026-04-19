import '../../../auth/domain/repostories/i_auth_repository.dart';
import '../repositories/i_matches_repository.dart';

class GetExcludedMatchesUseCase {
  final IMatchesRepository _matchesRepository;
  final IAuthRepository _authRepository;

  GetExcludedMatchesUseCase({
    required IMatchesRepository matchesRepository,
    required IAuthRepository authRepository,
  }) : _matchesRepository = matchesRepository,
       _authRepository = authRepository;

  Future<List<String>> call() async {
    final uid = await _authRepository.requireUserId();

    final matchIds = await _matchesRepository.getUidsWhereIncludeUser(
      uid: uid,
    );

    final uids = matchIds
        .map(
          (matchId) {
        final parts = matchId.split('_');
        // Возвращаем часть, которая не равна текущему пользователю
        return parts.firstWhere(
              (part) => part != uid,
          orElse: () => '',
        );
      },
    )
        .where((otherUid) => otherUid.isNotEmpty)
        .toList();

    return uids;
  }
}
