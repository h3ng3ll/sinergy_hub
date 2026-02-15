import 'package:flutter_webrtc/flutter_webrtc.dart';

import '../../../calls/domain/models/ice_candidate/ice_candidate.dart';

abstract class IWebRtcService {


  MediaStream? get localStream;
  Stream<MediaStream> get remoteStream;

  Future<void> init();

  Future<String> createOffer();

  Future<String> createAnswer();

  Future<void> setRemoteSdp(
    String sdp,
  );

  Stream<IceCandidate> onIceCandidate();

  Future<void> addIceCandidate(
    IceCandidate candidate,
  );

  Future<void> close();
}
