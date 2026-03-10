import '../../data/models/matches_dto/matches_dto.dart';
import '../../presentation/bloc/tinder_card_cubit/tinder_card_cubit.dart';
import '../../../user/domain/repositories/i_user_repository.dart';
import '../models/user_match/matches.dart';
import '../repositories/i_matches_repository.dart';

class GetAUserMatchIncomeUseCase {
  final IMatchesRepository _userMatchingInRepository;
  final IUserRepository _userRepository;

  GetAUserMatchIncomeUseCase({
    required IMatchesRepository userMatchingInRepository,
    required IUserRepository userRepository,
  }) : _userMatchingInRepository = userMatchingInRepository,
       _userRepository = userRepository;

  Future<Matches?> call({
    required String uid,
  }) async {
    final MatchesDto? possibleMatch = await _userMatchingInRepository.getById(
      uid: uid,
    );

    final user = await _userRepository.getUserById(
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
