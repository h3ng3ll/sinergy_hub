import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/services/audio_service.dart';
import '../../../../../gen/assets.gen.dart';
import '../../../../auth/domain/services/i_webrtc_service.dart';
import '../../../domain/models/call/call.dart';
import '../../../domain/use_cases/accept_call_use_case.dart';
import '../../../domain/use_cases/add_ice_candidate_call_use_case.dart';
import '../../../domain/use_cases/decline_call_use_case.dart';
import '../../../domain/use_cases/hang_up_call_use_case.dart';
import '../../../domain/use_cases/listen_call_use_case.dart';
import '../../../domain/use_cases/listen_candidate_use_case.dart';
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
  final AudioService _audioService;
  final ListenCandidateUseCase _listenCandidateUseCase;
  final AddIceCandidateCallUseCase _addIceCandidateCallUseCase;

  CallBloc({
    required StartCallUseCase startCallUseCase,
    required AcceptCallUseCase acceptCallUseCase,
    required HangUpCallUseCase hangUpCallUseCase,
    required ListenCallUseCase listenCallUseCase,
    required DeclineCallUseCase declineCallUseCase,
    required IWebRtcService webRtcService,
    required AudioService audioService,
    required ListenCandidateUseCase listenCandidateUseCase,
    required AddIceCandidateCallUseCase addIceCandidateCallUseCase,
  }) : _startCallUseCase = startCallUseCase,
       _acceptCallUseCase = acceptCallUseCase,
       _webRtcService = webRtcService,
       _listenCallUseCase = listenCallUseCase,
       _declineCallUseCase = declineCallUseCase,
       _audioService = audioService,
       _hangUpCallUseCase = hangUpCallUseCase,
       _listenCandidateUseCase = listenCandidateUseCase,
       _addIceCandidateCallUseCase = addIceCandidateCallUseCase,
       super(const CallState()) {
    on<_Ring>(_ring);
    on<_Accept>(_accept);
    on<_HangUp>(_hangUp);
    on<_RemoteStream>(_remoteStream);
    on<_ListenCalls>(_listenCalls);
    on<_Decline>(_decline);
    on<_ListenIceCandidates>(_listenIceCandidates);
    on<_ListenRemoteMediaStream>(
      _listenRemoteMediaStream,
      transformer: restartable(),
    );
  }

  Future<void> _listenCalls(
    _ListenCalls event,
    Emitter<CallState> emit,
  ) async => await emit.forEach(
    _listenCallUseCase.call(),
    onData: (Call? call) {
      final prevCall = state.aCall;

      if (call == null) {
        return state.copyWith(
          aCall: null,
          status: ECallStatus.idle,
        );
      }
      if (call.isCalling && !(prevCall?.isCalling ?? false)) {
        _audioService.playAsset(
          Assets.sounds.incomeCall,
          releaseMode: ReleaseMode.loop,
        );
      }

      /// stop playing  if call status changed
      if (!call.isCalling && (prevCall?.isCalling ?? false)) {
        _audioService.stop();
      }
      return state.copyWith(
        aCall: call,
        status: call.status,
      );
    },
    onError: (e, __) => state.copyWith(),
  );

  void _listenIceCandidates(
    _ListenIceCandidates event,
    Emitter<CallState> emit,
  ) async => emit.forEach(
    _listenCandidateUseCase.execute(),
    onData: (candidate) {
      if (candidate != null) {
        /// add Ice candidate available for communication
        _addIceCandidateCallUseCase.call(
          callId: event.callId,
          iceCandidate: candidate,
        );
      }
      return state;
    },
  );

  void _listenRemoteMediaStream(
    _ListenRemoteMediaStream event,
    Emitter<CallState> emit,
  ) async => emit.forEach<MediaStream>(
    _webRtcService.remoteStream,
    onData: (stream) {
      return state.copyWith(
        remoteStream: stream,
        isConnected: true,
      );
    },
    onError: (e, _) {
      return state.copyWith(
        status: ECallStatus.ended,
        errorMessage: e.toString(),
      );
    },
  );

  void _decline(
    _Decline event,
    Emitter<CallState> emit,
  ) async {
    try {
      await _declineCallUseCase.execute(
        state.aCall!,
      );
      emit(
        state.copyWith(
          status: ECallStatus.declined,
          aCall: null,
        ),
      );
    } catch (e) {
      rethrow;
    }
  }

  void _ring(
    _Ring event,
    Emitter<CallState> emit,
  ) async {
    try {
      final callId = await _startCallUseCase.execute(
        event.calleeId,
      );

      emit(
        state.copyWith(
          localStream: _webRtcService.localStream,
          aCall: state.aCall?.copyWith(
            id: callId,
          ),
        ),
      );

      // Listen for remote stream using emit.forEach (proper pattern)
      add(
        CallEvent.listenRemoteMediaStream(),
      );
      // Listen for ICE candidates from callee
      add(
        CallEvent.listenIceCandidates(
          callId: callId,
        ),
      );
      // emit.forEach(
      //   _webRtcService.onIceCandidate(),
      //   onData: (e) {
      //     _addIceCandidateCallUseCase.call(
      //       callId: callId,
      //       iceCandidate: e,
      //     );
      //     return state;
      //   },
      //   onError: (e, _) {
      //     return state.copyWith(
      //       status: ECallStatus.ended,
      //       errorMessage: e.toString(),
      //     );
      //   },
      // );
    } catch (e) {
      emit(
        state.copyWith(
          status: ECallStatus.ended,
          errorMessage: e.toString(),
        ),
      );
      rethrow;
    }
  }

  void _hangUp(_HangUp event, emit) async {
    try {
      await _hangUpCallUseCase.execute(
        state.aCall?.id ?? '',
      );
      emit(
        state.copyWith(
          status: ECallStatus.ended,
          aCall: null,
        ),
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
      emit(
        state.copyWith(
          status: ECallStatus.loading,
        ),
      );

      // Listen for remote stream BEFORE accepting (to not miss the stream)
      emit.forEach<MediaStream>(
        _webRtcService.remoteStream,
        onData: (stream) {
          return state.copyWith(
            remoteStream: stream,
            isConnected: true,
            status: ECallStatus.accepted,
          );
        },
        onError: (e, _) {
          return state.copyWith(
            status: ECallStatus.ended,
            errorMessage: e.toString(),
          );
        },
      );

      await _acceptCallUseCase.execute(
        state.aCall!,
      );
      add(
        CallEvent.listenIceCandidates(
          callId: state.aCall!.id,
        ),
      );
      emit(
        state.copyWith(
          localStream: _webRtcService.localStream,
          status: ECallStatus.accepted,
        ),
      );

      // Listen for ICE candidates from caller
      add(
        CallEvent.listenIceCandidates(
          callId: state.aCall!.id,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: ECallStatus.ended,
          errorMessage: e.toString(),
        ),
      );
      rethrow;
    }
  }
}
