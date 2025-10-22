import '../models/user_match/user_match.dart';

abstract class IUserMatchingOutRepository {
  Future<UserMatch> create({
    required String uid,
    required UserMatch match,
  });

  // Stream<List<Map<String, dynamic>>>  get({
  //   required String uid,
  // });
}
