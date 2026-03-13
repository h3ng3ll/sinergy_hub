import '../../../auth/domain/repostories/i_auth_repository.dart';
import '../../../user/domain/repositories/i_user_repository.dart';
import '../models/matches_filter/matches_filter.dart';
import '../repositories/i_matches_repository.dart';

class GetExcludedMatchesUseCase {
  final IMatchesRepository _matchesRepository;
  final IAuthRepository _authRepository;

  GetExcludedMatchesUseCase({
    required IUserRepository userRepository,

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
          (e) => e
              .split('_')
              .firstWhere(
                (ee) => ee != uid,
              ),
        )
        .toList();
    return uids;
  }
}
