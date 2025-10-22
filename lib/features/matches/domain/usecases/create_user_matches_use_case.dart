import '../models/user_match/user_match.dart';
import '../repositories/i_user_matching_repository.dart';

class CreateUserMatchesUseCase {
  final IUserMatchingRepository _userMatchingRepository;

  CreateUserMatchesUseCase({
    required IUserMatchingRepository userMatchingRepository,
  }) : _userMatchingRepository = userMatchingRepository;

  Future<UserMatch> call({
    required String uid,
    required UserMatch match,
  }) {
    return _userMatchingRepository.create(
      uid: uid,
      match: match,
    );
  }
}
