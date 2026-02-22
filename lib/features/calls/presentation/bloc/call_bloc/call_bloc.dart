import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../auth/domain/services/i_webrtc_service.dart';
import '../../../domain/models/call/call.dart';
import '../../../domain/use_cases/accept_call_use_case.dart';
import '../../../domain/use_cases/decline_call_use_case.dart';
import '../../../domain/use_cases/hang_up_call_use_case.dart';
import '../../../domain/use_cases/listen_call_use_case.dart';
import '../../../domain/use_cases/start_call_use_case.dart';

part 'call_event.dart';

part 'call_state.dart';

part 'call_bloc.freezed.dart';

class CallBloc extends Bloc<CallEvent, CallState> {
  final StartCallUseCase _startCallUseCase;
  final AcceptCallUseCase _acceptCallUseCase;
  final DeclineCallUseCase _declineCallUseCase;
  final HangUpCallUseCase _hangUpCallUseCase;
  final ListenCallUseCase _listenCallUseCase;
  final IWebRtcService _webRtcService;

  CallBloc({
    required StartCallUseCase startCallUseCase,
    required AcceptCallUseCase acceptCallUseCase,
    required HangUpCallUseCase hangUpCallUseCase,
    required ListenCallUseCase listenCallUseCase,
    required DeclineCallUseCase declineCallUseCase,
    required IWebRtcService webRtcService,
  }) : _startCallUseCase = startCallUseCase,
       _acceptCallUseCase = acceptCallUseCase,
       _webRtcService = webRtcService,
       _listenCallUseCase = listenCallUseCase,
       _declineCallUseCase = declineCallUseCase,
       _hangUpCallUseCase = hangUpCallUseCase,
       super(const CallState()) {
    on<_Ring>(_ring);
    on<_Accept>(_accept);
    on<_HangUp>(_hangUp);
    on<_RemoteStream>(_remoteStream);
    on<_ListenCalls>(_listenCalls);
    on<_Decline>(_decline);
  }

  Future<void> _listenCalls(
    _ListenCalls event,
    Emitter<CallState> emit,
  ) async => await emit.forEach(
    _listenCallUseCase.execute(),
    onData: (call) => state.copyWith(
      aCall: call,
    ),
    onError: (e, __) => state,
  );

  void _decline(
    _Decline event,
    Emitter<CallState> emit,
  ) async {
    try {
      _declineCallUseCase.execute(
        state.aCall!,
      );
    } catch (e) {
      rethrow;
    }
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
        state.aCall!,
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
