import 'package:bloc/bloc.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../auth/domain/services/i_webrtc_service.dart';
import '../../../domain/models/call/call.dart';
import '../../../domain/use_cases/accept_call_use_case.dart';
import '../../../domain/use_cases/start_call_use_case.dart';

part 'call_event.dart';

part 'call_state.dart';

part 'call_bloc.freezed.dart';

class CallBloc extends Bloc<CallEvent, CallState> {
  final StartCallUseCase _startCallUseCase;
  final AcceptCallUseCase _acceptCallUseCase;
  final IWebRtcService _webRtcService;

  CallBloc({
    required StartCallUseCase startCallUseCase,
    required AcceptCallUseCase acceptCallUseCase,
    required IWebRtcService webRtcService,
  }) : _startCallUseCase = startCallUseCase,
       _acceptCallUseCase = acceptCallUseCase,
       _webRtcService = webRtcService,
       super(const CallState()) {
    on<_Ring>(_ring);
    on<_Accept>(_accept);
    on<_RemoteStream>(_remoteStream);
  }

  void _ring(_Ring event, emit) async {
    try {
      await _startCallUseCase.execute(
        event.calleeId,
      );
      _webRtcService.remoteStream.listen(
        (stream) {
          add(
            CallEvent.remoteStream(
              stream: stream,
            ),
          );
        },
      );
    } catch (e) {
      rethrow;
    }
  }

  void _remoteStream(_RemoteStream event, emit) async {
    emit(
      state.copyWith(
        remoteStream: event.stream,
        isConnected: true,
      ),
    );
  }

  Future<void> _accept(_Accept event, Emitter<CallState> emit) async {
    try {
      await _acceptCallUseCase.execute(
        event.ring,
      );

      emit(
        state.copyWith(
          localStream: _webRtcService.localStream,
        ),
      );

      _webRtcService.remoteStream.listen(
        (stream) {
          add(
            CallEvent.remoteStream(
              stream: stream,
            ),
          );
        },
      );
    } catch (e) {
      rethrow;
    }
  }
}
