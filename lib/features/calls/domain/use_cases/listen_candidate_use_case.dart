import '../../../auth/domain/services/i_webrtc_service.dart';
import '../models/ice_candidate/ice_candidate.dart';
import '../repositories/i_calls_repository.dart';
import '../models/call/call.dart';

class ListenCandidateUseCase {
  final ICallsRepository _callsRepository;

  ListenCandidateUseCase({
    required ICallsRepository callsRepository,
  }) : _callsRepository = callsRepository;

  Stream<IceCandidate> execute(
    String callId,
  ) {
    return _callsRepository.listenCandidate(
      callId,
    );
  }
}
