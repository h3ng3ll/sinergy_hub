import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/services/firebase/firebase_auth_service.dart';
import '../../../../core/services/firebase/firebase_firestore_service.dart';
import '../../../../core/services/firebase/firebase_storage_service.dart';
import '../../../matches/domain/models/e_location_filter_mode.dart';
import '../../../matches/domain/models/matches_filter/matches_filter.dart';
import '../../../matches/domain/repositories/i_nearby_candidates_repository.dart';
import '../../../onboard_survey/domain/models/user_profiler/user_profiler.dart';
import '../mapper/user_data_mapper.dart';
import '../../domain/models/user_data/user_data.dart';
import '../../domain/models/users_data_pg_state/users_data_pg_state.dart';
import '../../domain/repositories/i_user_auth_repository.dart';
import '../../domain/repositories/i_user_read_repository.dart';
import '../../domain/repositories/i_user_storage_repository.dart';
import '../../domain/repositories/i_user_write_repository.dart';
import '../queries/user_query_builder.dart';

class UserFirebaseRepository
    implements
        IUserReadRepository,
        IUserWriteRepository,
        IUserStorageRepository,
        IUserAuthRepository {
  final FirebaseAuthService _firebaseAuthService;
  final FirebaseFirestoreService _firebaseFirestoreService;
  final FirebaseStorageService _firebaseStorageService;
  final INearbyCandidatesRepository _nearbyCandidatesRepository;

  final String path = 'user_avatars';

  String _avatarStoragePath(
    String uid,
    String name,
  ) => 'users/$uid/$name';

  UserFirebaseRepository({
    required FirebaseAuthService firebaseAuthService,
    required FirebaseFirestoreService firebaseFirestoreService,
    required FirebaseStorageService firebaseStorageService,
    required INearbyCandidatesRepository nearbyCandidatesRepository,
  }) : _firebaseAuthService = firebaseAuthService,
       _firebaseFirestoreService = firebaseFirestoreService,
       _firebaseStorageService = firebaseStorageService,
       _nearbyCandidatesRepository = nearbyCandidatesRepository;

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

    // Deleted accounts must never surface in the matches feature.
    return results.whereActive().toList();
  }

  @override
  Future<UserDataPgState> get({
    required UserDataPgState userDataState,
    MatchesFilter? filter,
  }) async {
    // Distance mode has no coordinates to query with locally — it can only
    // run server-side (docs/location_backend_contract.md §4).
    if (filter?.locationMode == ELocationFilterMode.radius) {
      return _nearbyCandidatesRepository.search(
        userDataState: userDataState,
        filter: filter!,
      );
    }

    Query query = _firebaseFirestoreService.usersDocument;

    query = UserQueryBuilder.applyFilters(query, filter);

    if (userDataState.lastDocument != null) {
      query = _firebaseFirestoreService.applyPagination(
        query,
        userDataState.lastDocument!,
      );
    }

    final res = await query.get();

    final List<UserData> userData = UserDataMapper.fromSnapshotList(
      res,
    );
    return userDataState.copyWith(
      items: [
        ...userDataState.items,
        ...userData,
      ],
      hasMore: res.docs.isNotEmpty,
      lastDocument: res.docs.isNotEmpty
          ? res.docs.last
          : userDataState.lastDocument,
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
    final userSnapshot = await _firebaseFirestoreService
        .userDocument(
          id,
        )
        .get();
    final UserData? user = UserDataMapper.fromDocSnapshot(
      userSnapshot,
    );
    // A deleted account must not be resolvable in the matches feature.
    if (user != null && !user.isActive) return null;
    return user;
  }

  @override
  Stream<UserData?> userDataStream(
    String streamUid,
  ) {
    return _firebaseFirestoreService.authGated(
      (uid) => _firebaseFirestoreService.usersDocument
          .doc(
            streamUid,
          )
          .snapshots()
          .map(
            (snapshot) {
              return UserDataMapper.fromDocSnapshot(
                snapshot,
              );
            },
          ),
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
      'avatar_${DateTime.now().millisecondsSinceEpoch}.jpeg',
    );

    await _firebaseStorageService.uploadBytes(
      path: path,
      bytes: avatar,
    );

    return path;
  }

  @override
  Future<void> deleteAvatar({
    required String path,
  }) async {
    try {
      await _firebaseStorageService.delete(
        path,
      );
    } catch (e, _) {
      rethrow;
    }
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
        .set(
          {
            'uid': uid,
            'profiler': userProfiler.toJson(),
          },
          SetOptions(
            merge: true,
          ),
        );
  }

  @override
  Future<String> getAvatarUrl({
    required String avatarPath,
  }) {
    return _firebaseStorageService.getDownloadUrl(
      avatarPath,
    );
  }
}
