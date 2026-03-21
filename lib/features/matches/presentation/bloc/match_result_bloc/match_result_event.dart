part of 'match_result_bloc.dart';

@freezed
sealed class MatchResultEvent with _$MatchResultEvent {
  const factory MatchResultEvent.getResult({
    required String matchId,
  }) = _GetResult;
}