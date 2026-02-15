import 'dart:async';

import 'package:flutter_webrtc/flutter_webrtc.dart';

import '../../features/auth/domain/services/i_webrtc_service.dart';
import '../../features/calls/domain/models/ice_candidate/ice_candidate.dart';

class WebrtcService implements IWebRtcService {
  RTCPeerConnection? _pc;

  final _iceController = StreamController<IceCandidate>.broadcast();
  final _remoteStreamController = StreamController<MediaStream>.broadcast();
  MediaStream? _localStream;

  @override
  Future<void> addIceCandidate(IceCandidate c) async {
    await _pc!.addCandidate(
      RTCIceCandidate(
        c.candidate,
        c.sdpMid,
        c.sdpMineIndex,
      ),
    );
  }

  @override
  Future<void> close() async {
    await _pc?.close();
    await _localStream?.dispose();
    await _iceController.close();
    await _remoteStreamController.close();
  }

  @override
  Future<String> createAnswer() async {
    final answer = await _pc!.createAnswer();
    await _pc!.setLocalDescription(
      answer,
    );
    return answer.sdp!;
  }

  @override
  Future<String> createOffer() async {
    final offer = await _pc!.createOffer();
    await _pc!.setLocalDescription(
      offer,
    );
    return offer.sdp!;
  }

  @override
  Future<void> init() async {
    final config = {
      'iceServers': [
        {'urls': 'stun:stun.l.google.com:19302'},
      ],
    };

    _pc = await createPeerConnection(config);

    // Get camera + mic
    _localStream = await navigator.mediaDevices.getUserMedia({
      'video': true,
      'audio': true,
    });

    // Add tracks to connection
    for (var track in _localStream!.getTracks()) {
      await _pc!.addTrack(track, _localStream!);
    }

    // ICE
    _pc!.onIceCandidate = (c) {
      if (c.candidate != null) {
        _iceController.add(
          IceCandidate(
            candidate: c.candidate!,
            sdpMid: c.sdpMid,
            sdpMineIndex: c.sdpMLineIndex,
          ),
        );
      }
    };

    // Remote stream arrives here
    _pc!.onTrack = (event) {
      if (event.streams.isNotEmpty) {
        _remoteStreamController.add(event.streams.first);
      }
    };
  }

  @override
  Stream<IceCandidate> onIceCandidate() {
    return _iceController.stream;
  }

  @override
  Future<void> setRemoteSdp(String sdp) async {
    await _pc!.setRemoteDescription(
      RTCSessionDescription(
        sdp,
        'offer',
      ),
    );
  }

  @override
  MediaStream? get localStream => _localStream;

  @override
  Stream<MediaStream> get remoteStream => _remoteStreamController.stream;
}
