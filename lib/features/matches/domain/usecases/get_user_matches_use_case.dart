import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../home/presentation/tabs/home_tab/bloc/tinder_card_cubit/tinder_card_cubit.dart';
import '../../../user/domain/repositories/i_user_repository.dart';
import '../models/user_match/user_match.dart';
import '../repositories/i_user_matching_repository.dart';

class GetUserMatchesUseCase {
  final IUserMatchingRepository _userMatchingRepository;
  final IUserRepository _userRepository;

  GetUserMatchesUseCase({
    required IUserMatchingRepository userMatchingRepository,
    required IUserRepository userRepository,
  }) : _userMatchingRepository = userMatchingRepository,
       _userRepository = userRepository;

  Stream<List<UserMatch>> call(String uid) {
    return _userMatchingRepository
        .get(
          uid: uid,
        )
        .asyncMap(
          (matches) async {
            // final List<Map<String, dynamic>> matches = data
            //     .map(
            //       (doc) => (doc['matches'] as List<dynamic>).map(
            //         (match) => Map<String, dynamic>.from(match),
            //       ),
            //     )
            //     .expand((x) => x) // flatten List<List<Map>>
            //     .toList();

            final uids = matches
                .map((match) => match['user'] as String)
                .toList();

            final users = await _userRepository.getUsersById(
              ids: uids,
            );

            // создаём словарь для быстрого поиска пользователя по uid
            final userById = {for (var u in users) u.uid: u};

            // собираем UserMatch
            final userMatches = matches.map((match) {
              final uid = match['user'] as String;
              final user =
                  userById[uid]!; // предполагаем, что пользователь точно есть

              return UserMatch(
                user: user,
                time: (match['time'] as Timestamp).toDate(),
                // если time это Timestamp
                icon: match['icon'] ?? '',
                status: TinderCardStatus.values.firstWhere(
                  (e) => e.name == match['status'],
                ),
              );
            }).toList();

            return userMatches;
          },
        );
  }
}
