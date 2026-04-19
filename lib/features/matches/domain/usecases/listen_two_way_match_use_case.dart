import 'package:collection/collection.dart';

import '../../../auth/domain/repostories/i_auth_repository.dart';
import '../../../user/domain/repositories/i_user_read_repository.dart';
import '../../data/models/matches_dto/matches_dto.dart';
import '../exception/no_found_participants_in_matches_exception.dart';
import '../models/user_match/matches.dart';
import '../repositories/i_matches_repository.dart';

class ListenTwoWayMatchUseCase {
  final IMatchesRepository _userMatchingInRepository;
  final IUserReadRepository _userReadRepository;
  final IAuthRepository _authRepository;

  ListenTwoWayMatchUseCase({
    required IMatchesRepository userMatchingInRepository,
    required IUserReadRepository userReadRepository,
    required IAuthRepository authRepository,
  }) : _userMatchingInRepository = userMatchingInRepository,
       _userReadRepository = userReadRepository,
       _authRepository = authRepository;

  Stream<Matches?> call() async* {
    final uid = await _authRepository.requireUserId();

    yield* _userMatchingInRepository
        .listenTwoWayMatch(
          uid: uid,
        )
        .asyncMap(
          (MatchesDto? matchDto) async {
            if (matchDto == null) return null;
            final userId = matchDto.users.firstWhereOrNull(
              (e) => e != uid,
            );
            if (userId == null) return null;
            final user = await _userReadRepository.getUserById(
              id: userId,
            );

            if (user == null) {
              throw NoFoundParticipantsInMatchesException();
            }

            return matchDto.toDomain(
              user,
            );
          },
        );
  }
}
