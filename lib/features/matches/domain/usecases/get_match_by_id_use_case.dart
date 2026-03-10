import '../../../auth/domain/repostories/i_auth_repository.dart';
import '../../../user/domain/repositories/i_user_repository.dart';
import '../models/user_match/matches.dart';
import '../repositories/i_matches_repository.dart';

class GetMatchByIdUseCase {
  final IUserRepository _userRepository;
  final IMatchesRepository _matchesRepository;
  final IAuthRepository _authRepository;

  GetMatchByIdUseCase({
    required IUserRepository userRepository,
    required IAuthRepository authRepository,
    required IMatchesRepository matchesRepository,
  }) : _userRepository = userRepository,
        _authRepository = authRepository,
       _matchesRepository = matchesRepository;

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
    final matchedUser = await _userRepository.getUserById(
      id: userId,
    );

    if (matchedUser == null) {
      throw Exception('Matched user not found');
    }

    return matchDto.toDomain(matchedUser);
  }
}
