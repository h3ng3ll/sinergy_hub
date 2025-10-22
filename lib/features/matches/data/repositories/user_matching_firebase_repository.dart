import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../core/services/firebase/firebase_firestore_service.dart';
import '../../domain/models/user_match/user_match.dart';
import '../../domain/repositories/i_user_matching_repository.dart';

class UserMatchingFirebaseRepository extends IUserMatchingRepository {
  final FirebaseFirestoreService _firebaseFirestoreService;

  UserMatchingFirebaseRepository({
    required FirebaseFirestoreService firebaseFirestoreService,
  }) : _firebaseFirestoreService = firebaseFirestoreService;

  ColRef _matches(
    String uid,
  ) => _firebaseFirestoreService
      .userDocument(
        uid,
      )
      .collection(
        'matches',
      );

  @override
  Future<UserMatch> create({
    required String uid,
    required UserMatch match,
  }) async {
    await _matches(uid).doc().set(
      {
        'matches': FieldValue.arrayUnion([
          {
            'status': match.status.name,
            'user': match.user.uid,
            'time': match.time,
          },
        ]),
      },
      SetOptions(
        merge: true,
      ), // важно, чтобы не переписать документ целиком
    );

    return match;
  }



  @override
  Stream<List<Map<String, dynamic>>> get({
    required String uid,
  }) {
    return _matches(uid).snapshots().map((querySnapshot) {
      // для каждого документа берём его список matches
      final allMatches = querySnapshot.docs
          .map(
            (doc) => (doc.data()['matches'] as List<dynamic>).map(
              (match) => Map<String, dynamic>.from(match),
            ),
          )
          .expand((x) => x) // flatten List<List<Map>> -> List<Map>
          .toList();

      return allMatches;
    });
    // }
    // return _matches(
    //   uid,
    // ).snapshots().asyncMap(
    //   (querySnapshot) async {
    //
    //     // final data  = querySnapshot.docs.
    //     // return querySnapshot.docs
    //     //     .map(
    //     //       (doc) => UserMatch.fromJson(
    //     //     doc.data(),
    //     //   ),
    //     // )
    //     //     .toList();
    //   }
    // );
  }
}
