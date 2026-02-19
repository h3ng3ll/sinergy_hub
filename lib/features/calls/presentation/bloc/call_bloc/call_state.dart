part of 'call_bloc.dart';

@freezed
sealed class CallState with _$CallState {
  const factory CallState({
    MediaStream? localStream,
    MediaStream? remoteStream,
    Call? aCall,
    @Default(false) bool isConnected,
    @Default(ECallStatus.idle) ECallStatus status,
    @Default('') String errorMessage,
  }) = _CallState;
}
