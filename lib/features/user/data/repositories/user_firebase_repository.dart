import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/services/firebase/firebase_auth_service.dart';
import '../../../../core/services/firebase/firebase_firestore_service.dart';
import '../../domain/models/user_data/user_data.dart';
import '../../domain/models/users_data_pg_state/users_data_pg_state.dart';
import '../../domain/repositories/i_user_repository.dart';

class UserFirebaseRepository extends IUserRepository {
  final FirebaseAuthService _firebaseAuthService;
  final FirebaseFirestoreService _firebaseFirestoreService;

  UserFirebaseRepository({
    required FirebaseAuthService firebaseAuthService,
    required FirebaseFirestoreService firebaseFirestoreService,
  }) : _firebaseAuthService = firebaseAuthService,
       _firebaseFirestoreService = firebaseFirestoreService;

  @override
  Stream<User?> currentUserStream() => _firebaseAuthService.userStream;

  @override
  Future<List<UserData>> getUsersById({
    required List<String> ids,
  }) async {
    if (ids.isEmpty) return [];
    final chunks = <List<String>>[];

    // Firestore limitation: whereIn ≤ 10
    for (var i = 0; i < ids.length; i += 10) {
      chunks.add(
        ids.sublist(
          i,
          (i + 10).clamp(0, ids.length),
        ),
      );
    }

    final results = <UserData>[];
    for (final chunk in chunks) {
      final snap = await _firebaseFirestoreService.usersDocument
          .where(
            FieldPath.documentId,
            whereIn: chunk,
          )
          .get();

      results.addAll(
        snap.docs.map(
          (doc) => UserData.fromJson(
            doc.data(),
          ),
        ),
      );
    }

    return results;
  }

  @override
  Future<List<UserData>> get({
    required UserDataPgState userDataState,
  }) async {
    final res = await _firebaseFirestoreService.usersDocument.get();

    final userData = List<UserData>.from(
      res.docs.map(
        (e) => UserData.fromJson(
          e.data(),
        ),
      ),
    );
    return userData;
  }

  @override
  Future<User?> currentUserFuture() async {
    return _firebaseAuthService.currentUser;
  }

  @override
  Future<UserData?> getUserById({
    required String id,
  }) async {
    final userRow = await _firebaseFirestoreService
        .userDocument(
          id,
        )
        .get();
    if (userRow.data() == null) return null;
    final user = UserData.fromJson(
      userRow.data()!,
    );
    return user;
  }
}
