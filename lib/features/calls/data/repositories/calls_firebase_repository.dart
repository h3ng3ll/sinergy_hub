import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../core/services/firebase/firebase_firestore_service.dart';
import '../../domain/models/call/call.dart';
import '../../domain/models/ice_candidate/ice_candidate.dart';
import '../../domain/repositories/i_calls_repository.dart';

class CallsFirebaseRepository implements ICallsRepository {
  final FirebaseFirestoreService _firebaseFirestoreService;

  CallsFirebaseRepository({
    required FirebaseFirestoreService firebaseFirestoreService,
  }) : _firebaseFirestoreService = firebaseFirestoreService;

  ColRef get _calls => _firebaseFirestoreService.calls();

  ColRef _candidates(
    String callId,
  ) => _calls
      .doc(
        callId,
      )
      .collection(
        'candidates',
      );

  @override
  Future<String> createCall(
    String uid,
    String calleeId,
  ) async {
    final doc = _calls.doc();
    final call = Call(
      id: doc.id,
      callerId: uid,
      calleeId: calleeId,
      createdAt: DateTime.now(),
    );
    await doc.set(
      call.toJson(),
    );
    return doc.id;
  }

  @override
  Future<void> endCall(String callId) async {
    await _calls
        .doc(
          callId,
        )
        .update(
          {
            'status': ECallStatus.ended.name,

            /// Todo: think how to synchronize correctly dates
            'endedAt': DateTime.now(),
          },
        );
  }

  @override
  Stream<Call?> listenCall(String uid) {
    return _calls
        .where(
          'calleeId',
          isEqualTo: uid,
        )
        // .where(
        //   'status',
        //   isEqualTo: ECallStatus.calling.name,
        // )
        .limit(
          2,
        )
        .snapshots()
        .map(
          (snapshot) {
            if (snapshot.docs.isEmpty) return null;
            return Call.fromJson(
              snapshot.docs.last.data(),
            );
          },
        );
  }

  @override
  Stream<IceCandidate?> listenCandidate(
    String callId,
  ) =>
      _candidates(
        callId,
      ).snapshots().map(
        (snapshot) => snapshot.docChanges
            .where(
              (e) => e.type == DocumentChangeType.added,
            )
            .map(
              (e) => IceCandidate.fromJson(
                e.doc.data()!,
              ),
            )
            .firstOrNull,
      );

  @override
  Future<void> sendAnswer(
    String callId,
    String sdp,
  ) async {
    await _calls
        .doc(
          callId,
        )
        .update(
          {
            'answerSdp': sdp,
          },
        );
  }

  @override
  Future<void> sendCandidate(
    String callId,
    IceCandidate candidate,
  ) async {
    await _candidates(
      callId,
    ).add(
      candidate.toJson(),
    );
  }

  @override
  Future<void> sendOffer(
    String callId,
    String sdp,
  ) async {
    await _calls
        .doc(
          callId,
        )
        .update(
          {
            'offerSdp': sdp,
          },
        );
  }

  @override
  Future<void> updateStatus(
    String callId,
    ECallStatus status,
  ) async {
    _calls
        .doc(
          callId,
        )
        .update(
          {
            'status': status.name,
          },
        );
  }
}
