import '../../../auth/domain/repostories/i_auth_repository.dart';
import '../../../user/domain/repositories/i_user_read_repository.dart';
import '../models/user_match/matches.dart';
import '../repositories/i_matches_repository.dart';

class GetMatchByIdUseCase {
  final IUserReadRepository _userReadRepository;
  final IMatchesRepository _matchesRepository;
  final IAuthRepository _authRepository;

  GetMatchByIdUseCase({
    required IUserReadRepository userReadRepository,
    required IMatchesRepository matchesRepository,
    required IAuthRepository authRepository,
  }) : _userReadRepository = userReadRepository,
       _matchesRepository = matchesRepository,
       _authRepository = authRepository;

  Future<Matches> call({
    required String matchId,
  }) async {
    final matchDto = await _matchesRepository.getById(
      uid: matchId,
    );

    if (matchDto == null) {
      throw Exception('Match not found');
    }
    final uid = await _authRepository.requireUserId();

    final userId = matchDto.users.firstWhere(
      (e) => e != uid,
    );
    final matchedUser = await _userReadRepository.getUserById(
      id: userId,
    );

    if (matchedUser == null) {
      throw Exception('Matched user not found');
    }

    return matchDto.toDomain(matchedUser);
  }
}
