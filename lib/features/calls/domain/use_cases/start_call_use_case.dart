import '../../../auth/domain/repostories/i_auth_repository.dart';
import '../../../auth/domain/services/i_webrtc_service.dart';
import '../repositories/i_calls_repository.dart';
import '../models/call/call.dart';

class StartCallUseCase {
  final ICallsRepository _callsRepository;
  final IWebRtcService _webrtc;
  final IAuthRepository _authRepository;

  StartCallUseCase({
    required ICallsRepository callsRepository,
    required IWebRtcService webrtc,
    required IAuthRepository authRepository,
  }) : _callsRepository = callsRepository,
       _webrtc = webrtc,
       _authRepository = authRepository;

  Future<String> execute(String calleeId) async {
    final uid = await _authRepository.requireUserId();

    await _webrtc.init();

    final callId = await _callsRepository.createCall(
      uid,
      calleeId,
    );

    final offer = await _webrtc.createOffer();

    await _callsRepository.sendOffer(
      callId,
      offer,
    );

    await _callsRepository.updateStatus(
      callId,
      ECallStatus.calling,
    );

    return callId;
  }
}
