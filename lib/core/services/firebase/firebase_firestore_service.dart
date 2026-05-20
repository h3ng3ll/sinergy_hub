import 'package:cloud_firestore/cloud_firestore.dart';

import '../../utils/app_config.dart';

typedef DocRef = DocumentReference<Map<String, dynamic>>;
typedef DocSnap = DocumentSnapshot<Map<String, dynamic>>;
typedef QuerySnap = QuerySnapshot<Map<String, dynamic>>;

typedef ColRef = CollectionReference<Map<String, dynamic>>;

class FirebaseFirestoreService {
  // final int _batchLimit = 500;
  final FirebaseFirestore _firebaseFirestore;

  FirebaseFirestoreService({
    required FirebaseFirestore firebaseFirestore,
  }) : _firebaseFirestore = firebaseFirestore;

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
