
import 'package:cloud_firestore/cloud_firestore.dart';




typedef DocRef = DocumentReference<Map<String, dynamic>>;
typedef DocSnap = DocumentSnapshot<Map<String, dynamic>>;
typedef QuerySnap = QuerySnapshot<Map<String, dynamic>>;

typedef ColRef = CollectionReference<Map<String, dynamic>>;

class FirebaseFirestoreService {
  static final instance = FirebaseFirestoreService._();

  FirebaseFirestoreService._();

  final int _batchLimit = 500;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  /// References
  DocRef _userDocument(String uid) => _firebaseFirestore
      .collection(
    'users',
  )
      .doc(
    uid,
  );

  ColRef _audioRecordCol(
      String uid,
      ) =>
      _userDocument(
        uid,
      ).collection(
        'audio_record',
      );

  ColRef _audioCollectionsCol(
      String uid,
      ) =>
      _userDocument(
        uid,
      ).collection(
        'audio_collection',
      );

  ColRef _subscriptionCol(
      String uid,
      ) =>
      _userDocument(
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