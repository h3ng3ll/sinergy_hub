import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../core/services/firebase/firebase_firestore_service.dart';
import '../../../matches/domain/models/e_location_filter_mode.dart';
import '../../../matches/domain/models/matches_filter/matches_filter.dart';
import '../mapper/user_data_mapper.dart';
import '../../domain/models/user_data/user_data.dart';
import '../../domain/models/users_data_pg_state/users_data_pg_state.dart';
import '../../domain/repositories/i_user_read_repository.dart';
import '../queries/user_query_builder.dart';

class FakeUserFirebaseRepository implements IUserReadRepository {
  final FirebaseFirestoreService _firebaseFirestoreService;

  FakeUserFirebaseRepository({
    required FirebaseFirestoreService firebaseFirestoreService,
  }) : _firebaseFirestoreService = firebaseFirestoreService;

  ColRef get _fakeUsers => _firebaseFirestoreService.fakeUsersDocument;

  DocRef _fakeUser(
    String uid,
  ) => _fakeUsers.doc(
    uid,
  );

  @override
  Future<UserDataPgState> get({
    required UserDataPgState userDataState,
    MatchesFilter? filter,
  }) async {
    // The tutorial/demo collection has no stored coordinates to search by —
    // a radius search here always yields no further results rather than
    // calling the (production-only) searchNearbyCandidates callable.
    if (filter?.locationMode == ELocationFilterMode.radius) {
      return userDataState.copyWith(hasMore: false);
    }

    Query query = _fakeUsers;

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
  Future<UserData?> getUserById({
    required String id,
  }) async {
    final userRow = await _fakeUser(
      id,
    ).get();

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
      final snap = await _fakeUsers
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
  Stream<UserData?> userDataStream(String uid) {
    return _fakeUsers
        .doc(
          uid,
        )
        .snapshots()
        .map(
          (snapshot) {
            return UserDataMapper.fromDocSnapshot(
              snapshot,
            );
          },
        );
  }
}
