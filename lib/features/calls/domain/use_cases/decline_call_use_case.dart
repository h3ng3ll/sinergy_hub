import '../../../auth/domain/services/i_webrtc_service.dart';
import '../repositories/i_calls_repository.dart';
import '../models/call/call.dart';

class DeclineCallUseCase {
  final ICallsRepository callsRepository;
  final IWebRtcService webrtc;

  DeclineCallUseCase({
    required this.callsRepository,
    required this.webrtc,
  });

  Future<void> execute(Call call) async {
    // await webrtc.init();
    //
    // await webrtc.setRemoteSdp(
    //   call.offerSdp!,
    // );
    //
    // final answer = await webrtc.createAnswer();
    //
    // await callsRepository.sendAnswer(
    //   call.id,
    //   answer,
    // );
    //
    // await callsRepository.updateStatus(
    //   call.id,
    //   ECallStatus.accepted,
    // );
  }
}
