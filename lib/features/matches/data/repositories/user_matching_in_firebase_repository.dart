
import '../../../../core/services/firebase/firebase_firestore_service.dart';
import '../../domain/models/user_match/user_match.dart';
import '../../domain/repositories/i_user_matching_in_repository.dart';
import '../../presentation/bloc/tinder_card_cubit/tinder_card_cubit.dart';
import '../models/user_match_dto/user_match_dto.dart';

class UserMatchingInFirebaseRepository extends IUserMatchingInRepository {
  final FirebaseFirestoreService _firebaseFirestoreService;

  UserMatchingInFirebaseRepository({
    required FirebaseFirestoreService firebaseFirestoreService,
  }) : _firebaseFirestoreService = firebaseFirestoreService;

  ColRef _matches(
    String uid,
  ) => _firebaseFirestoreService
      .userDocument(
        uid,
      )
      .collection(
        'matching_in',
      );

  @override
  Future<void> create({
    required String matchedID,
    required String uid,
    required TinderCardStatus status,
  }) async {
    final dto = UserMatchDto(
      userId: uid,
      matchStatus: status,
      time: DateTime.now(),
      completeness: EUserMatchCompleteness.none,
    );

    await _matches(
          matchedID,
        )
        .doc(
          uid,
        )
        .set(
          dto.toJson(),
        );
  }

  @override
  Stream<List<UserMatchDto>> listen({
    required String uid,
  }) {
    return _matches(
      uid,
    ).snapshots().map(
      (
        querySnapshot,
      ) {
        return querySnapshot.docs
            .map(
              (doc) => UserMatchDto.fromJson(
                doc.data(),
              ),
            )
            .toList();
      },
    );
  }

  /// Following path:
  /// /users/[uid]/matching_in/[uid]
  @override
  Future<UserMatchDto?> getById({
    required String uid,
  }) async {
    final res =
        await _matches(
              uid,
            )
            .doc(
              uid,
            )
            .get();
    final data = res.data();
    if (data == null) return null;
    return UserMatchDto.fromJson(
      data,
    );
  }
}
