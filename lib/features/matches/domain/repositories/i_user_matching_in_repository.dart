import '../../data/models/user_match_dto/user_match_dto.dart';
import '../models/user_match/user_match.dart';

abstract class IUserMatchingInRepository {
  /// Create matching for user who was
  /// matched by another user
  Future<UserMatch> create({
    required String uid,
    required UserMatch match,
  });

  Stream<List<UserMatchDto>> get({
    required String uid,
  });


  /// Try to Get incoming matches by Id
  Future<UserMatchDto?> getById({
    required String uid,
  });
}
