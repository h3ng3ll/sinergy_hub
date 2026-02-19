import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../auth/domain/services/i_webrtc_service.dart';
import '../../../domain/models/call/call.dart';
import '../../../domain/use_cases/accept_call_use_case.dart';
import '../../../domain/use_cases/hang_up_call_use_case.dart';
import '../../../domain/use_cases/listen_call_use_case.dart';
import '../../../domain/use_cases/start_call_use_case.dart';

part 'call_event.dart';

part 'call_state.dart';

part 'call_bloc.freezed.dart';

class CallBloc extends Bloc<CallEvent, CallState> {
  final StartCallUseCase _startCallUseCase;
  final AcceptCallUseCase _acceptCallUseCase;
  final HangUpCallUseCase _hangUpCallUseCase;
  final ListenCallUseCase _listenCallUseCase;
  final IWebRtcService _webRtcService;

  late final StreamSubscription<Call> _callStream;

  CallBloc({
    required StartCallUseCase startCallUseCase,
    required AcceptCallUseCase acceptCallUseCase,
    required HangUpCallUseCase hangUpCallUseCase,
    required ListenCallUseCase listenCallUseCase,
    required IWebRtcService webRtcService,
  }) : _startCallUseCase = startCallUseCase,
       _acceptCallUseCase = acceptCallUseCase,
       _webRtcService = webRtcService,
       _listenCallUseCase = listenCallUseCase,
       _hangUpCallUseCase = hangUpCallUseCase,
       super(const CallState()) {
    on<_Ring>(_ring);
    on<_Accept>(_accept);
    on<_HangUp>(_hangUp);
    on<_RemoteStream>(_remoteStream);
    on<_ListenCalls>(_listenCalls);
  }

  void _listenCalls(
    _ListenCalls event,
    Emitter<CallState> emit,
  ) {
    _callStream = _listenCallUseCase.execute().listen(
      (call) => emit(
        state.copyWith(
          aCall: call,
        ),
      ),
    );
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

  void _hangUp(_HangUp event, emit) async {
    try {
      await _hangUpCallUseCase.execute(
        state.aCall?.id ?? '',
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

  @override
  Future<void> close() {
    _callStream.cancel();
    return super.close();
  }
}
