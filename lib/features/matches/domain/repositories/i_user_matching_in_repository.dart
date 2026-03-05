import '../../data/models/user_match_dto/user_match_dto.dart';
import '../../presentation/bloc/tinder_card_cubit/tinder_card_cubit.dart';
import '../models/user_match/user_match.dart';

abstract class IUserMatchingInRepository {
  /// Create matching for user who was
  /// matched by another user
  Future<void> create({
    required String matchedID,
    required String uid,
    required TinderCardStatus status,
  });

  Stream<List<UserMatchDto>> listen({
    required String uid,
  });


  /// Try to Get incoming matches by Id
  Future<UserMatchDto?> getById({
    required String uid,
  });
}
