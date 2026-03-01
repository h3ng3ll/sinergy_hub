part of 'call_bloc.dart';

@freezed
class CallEvent with _$CallEvent {
  const factory CallEvent.listenCalls() = _ListenCalls;

  const factory CallEvent.listenIceCandidates({
    required String callId,
  }) = _ListenIceCandidates;

  const factory CallEvent.ring({
    required String calleeId,
  }) = _Ring;

  const factory CallEvent.accept() = _Accept;

  const factory CallEvent.decline() = _Decline;

  const factory CallEvent.hangUp() = _HangUp;

  const factory CallEvent.remoteStream({
    required MediaStream stream,
  }) = _RemoteStream;
}
