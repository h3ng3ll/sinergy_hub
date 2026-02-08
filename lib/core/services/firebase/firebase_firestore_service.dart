import 'package:cloud_firestore/cloud_firestore.dart';

typedef DocRef = DocumentReference<Map<String, dynamic>>;
typedef DocSnap = DocumentSnapshot<Map<String, dynamic>>;
typedef QuerySnap = QuerySnapshot<Map<String, dynamic>>;

typedef ColRef = CollectionReference<Map<String, dynamic>>;

class FirebaseFirestoreService {
  final int _batchLimit = 500;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  /// References
  ColRef get usersDocument => _firebaseFirestore.collection(
    'users',
  );

  DocRef userDocument(
    String uid,
  ) => usersDocument.doc(
    uid,
  );

  ColRef chats() => _firebaseFirestore
      .collection(
        'chats',
      );

  ColRef notifications() => _firebaseFirestore
      .collection(
    'notifications',
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

  ColRef _audioRecordCol(
    String uid,
  ) =>
      userDocument(
        uid,
      ).collection(
        'audio_record',
      );

  ColRef _audioCollectionsCol(
    String uid,
  ) =>
      userDocument(
        uid,
      ).collection(
        'audio_collection',
      );

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
