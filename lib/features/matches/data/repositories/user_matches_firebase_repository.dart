import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../core/services/firebase/firebase_firestore_service.dart';
import '../../domain/models/user_match/matches.dart';
import '../../domain/repositories/i_matches_repository.dart';
import '../models/matches_dto/matches_dto.dart';

class MatchesFirebaseRepository extends IMatchesRepository {
  final FirebaseFirestoreService _firebaseFirestoreService;

  MatchesFirebaseRepository({
    required FirebaseFirestoreService firebaseFirestoreService,
  }) : _firebaseFirestoreService = firebaseFirestoreService;

  ColRef _matches() => _firebaseFirestoreService.matches();

  @override
  Stream<MatchesDto?> listenTwoWayMatch({
    required String uid,
  }) {
    return _matches()
        .where(
          'completeness',
          isEqualTo: EMatchesCompleteness.twoWayMatch.name,
        )
        .where(
          'users',
          arrayContains: uid,
        )
        .where(
          'alreadyNotified.$uid',
          isEqualTo: false,
        )
        .snapshots()
        .map((
          querySnapshot,
        ) {
          if (querySnapshot.docChanges.isEmpty) return null;

          // Find the first added document
          for (var change in querySnapshot.docChanges) {
            if (change.type == DocumentChangeType.added) {
              return MatchesDto.fromJson(
                change.doc.data()!,
              );
            }
          }

          return null;
        })
        .where(
          (match) => match != null,
        );
  }

  /// Following path:
  /// /users/[uid]/matching_in/[uid]
  @override
  Future<MatchesDto?> getById({
    required String uid,
  }) async {
    final res = await _matches()
        .doc(
          uid,
        )
        .get();
    final data = res.data();
    if (data == null) return null;
    return MatchesDto.fromJson(
      data,
    );
  }

  @override
  Future<List<String>> getUids({
    required String uid,
  }) async {
    final snapshot = await _matches()
        .where(
          'users',
          arrayContains: uid,
        )
        .get();

    return snapshot.docs
        .map(
          (e) => e.id,
        )
        .toList();
  }

  @override
  Future<List<String>> getUidsWhereIncludeUser({
    required String uid,
  }) async {
    final snapshot = await _matches()
        .where(
          'answeredUids',
          arrayContains: uid,
        )
        .get();

    return snapshot.docs
        .map(
          (e) => e.id,
        )
        .toList();
  }

  @override
  Future<void> markAsNotified({
    required String matchId,
    required String uid,
  }) async {
    await _matches()
        .doc(
          matchId,
        )
        .update(
          {
            'alreadyNotified.$uid': true,
          },
        );
  }
}
