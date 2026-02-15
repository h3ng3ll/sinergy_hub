import '../models/call/call.dart';
import '../models/ice_candidate/ice_candidate.dart';

abstract class ICallsRepository {
  Future<String> createCall(
    String uid,
    String calleeId,
  );

  Stream<Call> listenCall(
    String callId,
  );

  Future<void> sendOffer(
    String callId,
    String sdp,
  );

  Future<void> sendAnswer(
    String callId,
    String sdp,
  );

  Future<void> sendCandidate(
    String callId,
    IceCandidate candidate,
  );

  Stream<IceCandidate> listenCandidate(
    String callId,
  );

  Future<void> updateStatus(
    String callId,
    ECallStatus status,
  );

  Future<void> endCall(
    String callId,
  );
}
