part of 'match_result_bloc.dart';

enum MatchResultStatus {
  initial,
  loading,
  loaded,
  failed,
}

@freezed
sealed class MatchResultState with _$MatchResultState {
  const factory MatchResultState({
    @Default(MatchResultStatus.initial) MatchResultStatus status,
    @Default('') String errorMessage,
    Matches? match,
    UserData? user,
  }) = _MatchResultState;
}