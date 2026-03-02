import '../../presentation/bloc/tinder_card_cubit/tinder_card_cubit.dart';
import '../../../user/domain/models/user_data/user_data.dart';
import '../../../user/domain/repositories/i_user_repository.dart';
import '../../data/models/user_match_dto/user_match_dto.dart';
import '../models/user_match/user_match.dart';
import '../repositories/i_user_matching_in_repository.dart';
import '../repositories/i_user_matching_out_repository.dart';

class GetAUserMatchIncomeUseCase {
  final IUserMatchingInRepository _userMatchingInRepository;
  final IUserRepository _userRepository;

  GetAUserMatchIncomeUseCase({
    required IUserMatchingInRepository userMatchingInRepository,
    required IUserRepository userRepository,
  }) : _userMatchingInRepository = userMatchingInRepository,
       _userRepository = userRepository;

  Future<UserMatch?> call({
    required String uid,
  }) async {
    final UserMatchDto? possibleMatch = await _userMatchingInRepository.getById(
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
