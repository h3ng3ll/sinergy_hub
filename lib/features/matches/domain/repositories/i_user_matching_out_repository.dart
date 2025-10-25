import '../../data/models/user_match_dto/user_match_dto.dart';
import '../models/user_match/user_match.dart';

abstract class IUserMatchingOutRepository {
  Future<UserMatch> create({
    required String uid,
    required UserMatch match,
  });

  Stream<List<UserMatchDto>> get({
    required String uid,
  });

}
