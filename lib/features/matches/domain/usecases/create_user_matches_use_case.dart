import '../../../home/presentation/tabs/home_tab/bloc/tinder_card_cubit/tinder_card_cubit.dart';
import '../models/user_match/user_match.dart';
import '../repositories/i_user_matching_in_repository.dart';
import '../repositories/i_user_matching_out_repository.dart';

class CreateUserMatchesUseCase {
  final IUserMatchingOutRepository _userMatchingOutRepository;
  final IUserMatchingInRepository _userMatchingInRepository;

  CreateUserMatchesUseCase({
    required IUserMatchingOutRepository userMatchingOutRepository,
    required IUserMatchingInRepository userMatchingInRepository,
  }) : _userMatchingOutRepository = userMatchingOutRepository,
       _userMatchingInRepository = userMatchingInRepository;

  /// return Status of Matching
  Future<EUserMatchCompleteness> call({
    required String uid,
    required UserMatch match,
  }) async {
    if (match.matchStatus != TinderCardStatus.liked) {
      /// create match record in actor
      await _userMatchingOutRepository.create(
        uid: uid,
        match: match.copyWith(
          completeness: EUserMatchCompleteness.none,
        ),
      );
      return EUserMatchCompleteness.none;
    }

    /// who   matched create record
    /// process cases

    final possibleMatch = await _userMatchingInRepository.getById(
      uid: uid,
    );

    /// other user not match current one
    if (possibleMatch == null) {
      await _userMatchingOutRepository.create(
        uid: uid,
        match: match.copyWith(
          completeness: EUserMatchCompleteness.oneWayMatch,
        ),
      );
      await _userMatchingInRepository.create(
        uid: match.user.uid,
        match: match.copyWith(
          completeness: EUserMatchCompleteness.none,
        ),
      );
      return EUserMatchCompleteness.oneWayMatch;
    }

    ///  has matching from both size
    if (possibleMatch!.completeness == EUserMatchCompleteness.oneWayMatch) {
      await _userMatchingOutRepository.create(
        uid: uid,
        match: match.copyWith(
          completeness: EUserMatchCompleteness.twoWayMatch,
        ),
      );
      await _userMatchingInRepository.create(
        uid: match.user.uid,
        match: match.copyWith(
          completeness: EUserMatchCompleteness.twoWayMatch,
        ),
      );
      return EUserMatchCompleteness.twoWayMatch;
    }

    throw Exception(
      'Unhandled matching result ',
    );
  }
}
