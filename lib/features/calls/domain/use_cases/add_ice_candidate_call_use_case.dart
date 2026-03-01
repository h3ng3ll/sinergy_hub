import '../../../auth/domain/services/i_webrtc_service.dart';
import '../models/ice_candidate/ice_candidate.dart';
import '../repositories/i_calls_repository.dart';
import '../models/call/call.dart';

class AddIceCandidateCallUseCase {
  final ICallsRepository _callsRepository;
  final IWebRtcService _webrtc;

  AddIceCandidateCallUseCase({
    required ICallsRepository callsRepository,
    required IWebRtcService webrtc,
  }) : _callsRepository = callsRepository,
       _webrtc = webrtc;

  Future<void> call({
    required String callId,
    required IceCandidate iceCandidate,
  }) async {
    await _webrtc.addIceCandidate(
      iceCandidate,
    );
    await _callsRepository.sendCandidate(
      callId,
      iceCandidate,
    );
  }
}
