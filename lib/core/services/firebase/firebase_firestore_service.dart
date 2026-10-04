import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

import '../../utils/app_config.dart';
import '../logger_service.dart';

typedef DocRef = DocumentReference<Map<String, dynamic>>;
typedef DocSnap = DocumentSnapshot<Map<String, dynamic>>;
typedef QuerySnap = QuerySnapshot<Map<String, dynamic>>;

typedef ColRef = CollectionReference<Map<String, dynamic>>;

class FirebaseFirestoreService {
  // final int _batchLimit = 500;
  final FirebaseFirestore _firebaseFirestore;
  final FirebaseAuth _firebaseAuth;
  final LoggerService _logger;

  FirebaseFirestoreService({
    required FirebaseFirestore firebaseFirestore,
    required FirebaseAuth firebaseAuth,
    required LoggerService logger,
  }) : _firebaseFirestore = firebaseFirestore,
       _firebaseAuth = firebaseAuth,
       _logger = logger;

  /// Current authentication state, mirroring
  /// [FirebaseAuthRepository.watchUser] so gated streams react to the same
  /// signal that drives `AuthBloc`. Distinct on uid so the gate only rebuilds
  /// when the signed-in user actually changes (sign-in / sign-out / swap).
  Stream<User?> get authState => Rx.merge([
    _firebaseAuth.userChanges(),
    _firebaseAuth.authStateChanges(),
    _firebaseAuth.idTokenChanges(),
  ]).distinct((a, b) => a?.uid == b?.uid);

  /// Gates a Firestore listening stream on the auth state.
  ///
  /// While a user is signed in, [build] is invoked with the current uid and its
  /// stream flows through. The instant the user becomes `null` (sign-out /
  /// account deletion), `switchMap` swaps to an empty stream, which cancels the
  /// underlying `.snapshots()` listener automatically — no manual cancellation.
  ///
  /// A `permission-denied` error that races the sign-out (the listener firing
  /// just before it is torn down) is expected and benign: it is swallowed and
  /// logged as a WARNING. Any other error propagates unchanged so real failures
  /// still surface.
  ///
  /// The benign error can land on either side of the race: on the INNER stream
  /// (caught by the inner `handleError`) or — when auth emits `null` first and
  /// `switchMap` has already cancelled the inner subscription — on the OUTER
  /// stream. We therefore guard BOTH levels, otherwise an error that arrives
  /// after the swap bypasses the inner guard and reaches the bloc as a `failed`
  /// state.
  Stream<T> authGated<T>(
    Stream<T> Function(String uid) build,
  ) {
    return authState
        .switchMap((user) {
          if (user == null) {
            return Stream<T>.empty();
          }
          return build(user.uid).handleError(
            _warnAndSwallow,
            test: _isExpectedPermissionDenied,
          );
        })
        .handleError(
          _warnAndSwallow,
          test: _isExpectedPermissionDenied,
        );
  }

  void _warnAndSwallow(Object e, StackTrace st) {
    _logger.warning(
      'Suppressed post-signout Firestore permission-denied',
      error: e,
      name: 'AuthGate',
    );
  }

  bool _isExpectedPermissionDenied(dynamic e) =>
      e is FirebaseException && e.code == 'permission-denied';

  Future<void> init() async {
    if (AppConfig.isQA) {
      _firebaseFirestore.useFirestoreEmulator(
        AppConfig.emulatorAddress(),
        AppConfig.firestoreEmulatorPort,
      );
    }
  }

  /// References
  ColRef get usersDocument => _firebaseFirestore.collection(
    'users',
  );

  ColRef get fakeUsersDocument => _firebaseFirestore.collection(
    'fakeUsers',
  );

  /// Backend-owned "Liked you" change signal — read-only for the client.
  /// See docs/liked_you_backend_contract.md §11.
  DocRef likedYouMeta(
    String uid,
  ) => _firebaseFirestore
      .collection(
        'likedYouMeta',
      )
      .doc(
        uid,
      );

  DocRef userDocument(
    String uid,
  ) => usersDocument.doc(
    uid,
  );

  DocRef userOnboard(
    String uid,
  ) => usersDocument
      .doc(
        uid,
      )
      .collection(
        'onboardStatus',
      )
      .doc(
        'primary',
      );

  ColRef chats() => _firebaseFirestore.collection(
    'chats',
  );

  ColRef matches() => _firebaseFirestore.collection(
    'matches',
  );

  ColRef notifications({
    required String uid,
  }) =>
      userDocument(
        uid,
      ).collection(
        'notifications',
      );

  ColRef calls() => _firebaseFirestore.collection(
    'calls',
  );

  DocRef notificationConfig({
    required String uid,
  }) =>
      userDocument(
            uid,
          )
          .collection(
            'notificationConfig',
          )
          .doc(
            'config',
          );

  /// The user's background palette — see the appearance feature.
  DocRef appearancePalette({
    required String uid,
  }) => userDocument(
    uid,
  ).collection('appearance').doc('palette');

  Future<bool> isExistsDocument(DocRef document) async {
    final col = await document.get();
    return col.exists;
  }

  Future<void> updateDocument(
    DocRef document,
    Map<String, Object?> data,
  ) async {
    final isExists = await isExistsDocument(
      document,
    );
    if (!isExists) {
      document.set({});
    }
    await document.update(
      data,
    );
  }

  /// The document a page query continues after: the live [lastDocument]
  /// when the deck was fetched in this session, otherwise the snapshot
  /// re-read by [lastDocumentId] (a deck restored from the local cache).
  /// `null` — start from the top — when neither exists any more.
  Future<DocumentSnapshot?> resolvePageCursor(
    ColRef collection, {
    DocumentSnapshot? lastDocument,
    String? lastDocumentId,
  }) async {
    if (lastDocument != null) return lastDocument;
    if (lastDocumentId == null) return null;
    final snapshot = await collection.doc(lastDocumentId).get();
    return snapshot.exists ? snapshot : null;
  }

  Query applyPagination(
    Query query,
    DocumentSnapshot doc, {
    int pageSize = 10,
  }) {
    return query
        .orderBy(
          'createdAt',
          descending: true,
        )
        .startAfterDocument(
          doc,
        )
        .limit(
          pageSize,
        );
  }

  WriteBatch batch() => _firebaseFirestore.batch();
}
