import '../../../auth/domain/services/i_webrtc_service.dart';
import '../repositories/i_calls_repository.dart';
import '../models/call/call.dart';

class HangUpCallUseCase {
  final ICallsRepository callsRepository;
  final IWebRtcService webrtc;

  HangUpCallUseCase({
    required this.callsRepository,
    required this.webrtc,
  });

  Future<void> execute(
    String callId,
  ) async {
    await webrtc.close();
    await callsRepository.endCall(
      callId,
    );
    callsRepository.updateStatus(
      callId,
      ECallStatus.ended,
    );
  }
}
