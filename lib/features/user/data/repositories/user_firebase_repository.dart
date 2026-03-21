import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../../../../core/services/firebase/firebase_auth_service.dart';
import '../../../../core/services/firebase/firebase_firestore_service.dart';
import '../../../../core/services/firebase/firebase_storage_service.dart';
import '../../../matches/domain/models/matches_filter/matches_filter.dart';
import '../../../onboard_survey/domain/models/user_profiler/user_profiler.dart';
import '../../domain/models/user_data/user_data.dart';
import '../../domain/models/users_data_pg_state/users_data_pg_state.dart';
import '../../domain/repositories/i_user_repository.dart';

class UserFirebaseRepository extends IUserRepository {
  final FirebaseAuthService _firebaseAuthService;
  final FirebaseFirestoreService _firebaseFirestoreService;
  final FirebaseStorageService _firebaseStorageService;

  final String path = 'user_avatars';

  String _avatarStoragePath(
    String uid,
    String name,
  ) => 'users/$uid/$name';

  UserFirebaseRepository({
    required FirebaseAuthService firebaseAuthService,
    required FirebaseFirestoreService firebaseFirestoreService,
    required FirebaseStorageService firebaseStorageService,
  }) : _firebaseAuthService = firebaseAuthService,
       _firebaseFirestoreService = firebaseFirestoreService,
       _firebaseStorageService = firebaseStorageService;

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
  Future<UserDataPgState> get({
    required UserDataPgState userDataState,
    MatchesFilter? filter,
  }) async {
    Query query = _firebaseFirestoreService.usersDocument;

    if (filter != null && filter.isApplied) {
      if (filter.experience != null) {
        query = query.where(
          'profiler.experience',
          isEqualTo: filter.experience!.name,
        );
      }
      if (filter.specialization != null) {
        query = query.where(
          'profiler.specialization',
        );
      }
      if (filter.skills.isNotEmpty) {
        /// till 10 skills: cause firebase limitation
        query = query.where(
          'profiler.skills',
          arrayContainsAny: filter.skills.map(
            (e) => e.name,
          ),
        );
      }
    }

    /// pagination



    if (userDataState.lastDocument != null) {
      query = _firebaseFirestoreService.applyPagination(
        query,
        userDataState.lastDocument!,
      );
    }


    final QuerySnapshot res = await query.get();

    final userData = List<UserData>.from(
      res.docs.map(
        (e) {
          final userData = e.data();
          return UserData.fromJson(
            userData as Map<String, dynamic>,
          );
        },
      ).toList(),
    );
    return userDataState.copyWith(
      items: [
        ...userDataState.items,
        ...userData,
      ],
      hasMore: res.docs.isNotEmpty,
      lastDocument: res.docs.isNotEmpty ? res.docs.last : userDataState.lastDocument,
    );
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
    final userData = userRow.data();
    if (userData == null) {
      return null;
    }
    final user = UserData.fromJson(
      userData,
    );
    return user;
  }

  @override
  Stream<UserData?> userDataStream(
    String uid,
  ) {
    return _firebaseFirestoreService.usersDocument
        .doc(
          uid,
        )
        .snapshots()
        .map(
          (snapshot) {
            if (!snapshot.exists || snapshot.data() == null) return null;
            return UserData.fromJson(
              snapshot.data()!,
            );
          },
        );
  }

  @override
  Future<void> update({
    required UserData userData,
  }) async {
    final userJson = Map<String, dynamic>.from(
      userData.toJson(),
    );
    await _firebaseFirestoreService
        .userDocument(
          userData.uid,
        )
        .set(
          userJson,
        );
  }

  @override
  Future<String> updateAvatar({
    required String uid,
    required Uint8List avatar,
  }) async {
    final path = _avatarStoragePath(
      uid,
      'avatar_${DateTime.now().millisecondsSinceEpoch}.png',
    );

    final UploadTask uploadTask = _firebaseStorageService.uploadBytes(
      path: path,
      bytes: avatar,
      metadata: SettableMetadata(
        contentType: 'image/png',
      ),
    );
    final TaskSnapshot snapshot = await uploadTask;

    final String downloadUrl = await snapshot.ref.getDownloadURL();

    return downloadUrl;
  }

  @override
  Future<void> deleteAvatar({
    required String uid,
    required String name,
  }) async {
    final path = _avatarStoragePath(
      uid,
      name,
    );

    await _firebaseStorageService.delete(
      path,
    );
  }

  @override
  Future<void> setUserProfiler({
    required String uid,
    required UserProfiler userProfiler,
  }) async {
    await _firebaseFirestoreService
        .userDocument(
          uid,
        )
        .update(
          {
            'profiler': userProfiler.toJson(),
          },
        );
  }

  @override
  Future<UserData?> currentUserDataFuture() async {
    final uid = _firebaseAuthService.currentUser?.uid;
    if (uid == null) return null;
    return await getUserById(
      id: uid,
    );
  }
}
