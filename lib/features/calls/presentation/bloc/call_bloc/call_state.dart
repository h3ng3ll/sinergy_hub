part of 'call_bloc.dart';

extension CallStateX on CallState {
  bool get isCalling => status == ECallStatus.calling;
}

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
