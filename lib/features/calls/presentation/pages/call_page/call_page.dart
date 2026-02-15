import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';

import '../../bloc/call_bloc/call_bloc.dart';

class CallPage extends StatefulWidget {
  const CallPage({super.key});

  @override
  State<CallPage> createState() => _CallPageState();
}

class _CallPageState extends State<CallPage> {
  final _localRenderer = RTCVideoRenderer();
  final _remoteRenderer = RTCVideoRenderer();

  @override
  void initState() {
    super.initState();

    _initRenderers();
  }

  Future<void> _initRenderers() async {
    await _localRenderer.initialize();
    await _remoteRenderer.initialize();
  }

  @override
  void dispose() {
    _localRenderer.dispose();
    _remoteRenderer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<CallBloc, CallState>(
        listener: (context, state) {
          if (state.localStream != null) {
            _localRenderer.srcObject = state.localStream;
          }

          if (state.remoteStream != null) {
            _remoteRenderer.srcObject = state.remoteStream;
          }
        },
        builder: (context, state) {
          return Stack(
            children: [
              RTCVideoView(
                _remoteRenderer,
              ),

              Positioned(
                right: 20,
                bottom: 40,
                width: 120,
                height: 160,
                child: RTCVideoView(
                  _localRenderer,
                  mirror: true,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
