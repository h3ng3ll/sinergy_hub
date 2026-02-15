
import '../../presentation/bloc/tinder_card_cubit/tinder_card_cubit.dart';
import '../../../user/domain/models/user_data/user_data.dart';
import '../../../user/domain/repositories/i_user_repository.dart';
import '../../data/models/user_match_dto/user_match_dto.dart';
import '../models/user_match/user_match.dart';
import '../repositories/i_user_matching_in_repository.dart';
import '../repositories/i_user_matching_out_repository.dart';

class GetUserMatchesIncomeUseCase {
  final IUserMatchingInRepository _userMatchingInRepository;
  final IUserRepository _userRepository;

  GetUserMatchesIncomeUseCase({
    required IUserMatchingInRepository userMatchingInRepository,
    required IUserRepository userRepository,
  }) : _userMatchingInRepository = userMatchingInRepository,
       _userRepository = userRepository;

  Stream<List<UserMatch>> call(String uid) {
    return _userMatchingInRepository
        .get(
          uid: uid,
        )
        .asyncMap(
          (List<UserMatchDto> matchesRow) async {
            final users = await _userRepository.getUsersById(
              ids: matchesRow
                  .map(
                    (match) => match.userId,
                  )
                  .toList(),
            );
            // создаём словарь для быстрого поиска пользователя по uid
            final userById = {for (var u in users) u.uid: u};

            final userMatches = matchesRow.map((UserMatchDto match) {
              final uid = match.userId;
              final UserData user =
                  userById[uid]!; // предполагаем, что пользователь точно есть

              return match.toDomain(
                user,
              );
            }).toList();
            return userMatches;
          },
        );
  }
}
