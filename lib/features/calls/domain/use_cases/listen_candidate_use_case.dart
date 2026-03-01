import '../../../auth/domain/services/i_webrtc_service.dart';
import '../models/ice_candidate/ice_candidate.dart';
import '../repositories/i_calls_repository.dart';
import '../models/call/call.dart';

class ListenCandidateUseCase {
  final ICallsRepository _callsRepository;
  final IWebRtcService _webrtc;

  ListenCandidateUseCase({
    required ICallsRepository callsRepository,
    required IWebRtcService webrtc,
  }) : _callsRepository = callsRepository,
       _webrtc = webrtc;

  Stream<IceCandidate?> execute() {
    return _webrtc.onIceCandidate();
  }
}
