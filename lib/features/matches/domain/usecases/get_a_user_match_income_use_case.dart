import '../../../user/domain/repositories/i_user_read_repository.dart';
import '../../data/models/matches_dto/matches_dto.dart';
import '../models/user_match/matches.dart';
import '../repositories/i_matches_repository.dart';

class GetAUserMatchIncomeUseCase {
  final IMatchesRepository _userMatchingInRepository;
  final IUserReadRepository _userReadRepository;

  GetAUserMatchIncomeUseCase({
    required IMatchesRepository userMatchingInRepository,
    required IUserReadRepository userReadRepository,
  }) : _userMatchingInRepository = userMatchingInRepository,
       _userReadRepository = userReadRepository;

  Future<Matches?> call({
    required String uid,
  }) async {
    final MatchesDto? possibleMatch = await _userMatchingInRepository.getById(
      uid: uid,
    );

    final user = await _userReadRepository.getUserById(
      id: uid,
    );
    if (user == null) {
      return null;
    }
    return possibleMatch?.toDomain(
      user,
    );
  }
}
