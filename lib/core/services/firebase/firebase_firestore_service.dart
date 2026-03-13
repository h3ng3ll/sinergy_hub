import 'package:cloud_firestore/cloud_firestore.dart';

import '../../utils/app_config.dart';

typedef DocRef = DocumentReference<Map<String, dynamic>>;
typedef DocSnap = DocumentSnapshot<Map<String, dynamic>>;
typedef QuerySnap = QuerySnapshot<Map<String, dynamic>>;

typedef ColRef = CollectionReference<Map<String, dynamic>>;

class FirebaseFirestoreService {
  final int _batchLimit = 500;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

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

  Query applyPagination(Query query, DocumentSnapshot doc) {
    return query
        .orderBy(
          'createdAt',
          descending: true,
        )
        .startAfterDocument(
          doc,
        );
  }

  WriteBatch batch() => _firebaseFirestore.batch();

  // Query pagination({
  //   required ColRef ref,
  //   required Pageable pageable,
  // }) {
  //   Query query = ref
  //       .sk limit(
  //         pageable.pageSize,
  //       );
  //
  //   if (lastDoc != null) {
  //     query = query.startAfterDocument(
  //       lastDoc,
  //     );
  //   }
  //   return query;
  // }

  ColRef _subscriptionCol(
    String uid,
  ) =>
      userDocument(
        uid,
      ).collection(
        'subscription',
      );

  DocRef get _subscriptionDoc => _firebaseFirestore
      .collection(
        'app',
      )
      .doc(
        'subscriptions',
      );

  final _keywords = 'keywords';
  final _totalAudioRecordsDuration = 'total_audio_records_duration';

  /// End ref
}
