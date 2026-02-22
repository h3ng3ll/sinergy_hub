import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../core/services/firebase/firebase_firestore_service.dart';
import '../../domain/models/user_match/user_match.dart';
import '../../domain/repositories/i_user_matching_out_repository.dart';
import '../models/user_match_dto/user_match_dto.dart';

class UserMatchingOutFirebaseRepository extends IUserMatchingOutRepository {
  final FirebaseFirestoreService _firebaseFirestoreService;

  UserMatchingOutFirebaseRepository({
    required FirebaseFirestoreService firebaseFirestoreService,
  }) : _firebaseFirestoreService = firebaseFirestoreService;

  ColRef _matches(
    String uid,
  ) => _firebaseFirestoreService
      .userDocument(
        uid,
      )
      .collection(
        'matching_out',
      );

  @override
  Future<UserMatch> create({
    required String uid,
    required UserMatch match,
  }) async {
    await _matches(uid)
        .doc(
          match.user.uid,
        )
        .set(
          UserMatchDto.fromDomain(
            match,
          ).toJson(),
        );

    return match;
  }

  @override
  Stream<List<UserMatchDto>> get({
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

  @override
  Future<List<String>> getUids({
    required String uid,
  }) async {
    final snapshot = await _matches(
      uid,
    ).get();
    return snapshot.docs
        .map(
          (e) => e.id,
        )
        .toList();
  }

}
