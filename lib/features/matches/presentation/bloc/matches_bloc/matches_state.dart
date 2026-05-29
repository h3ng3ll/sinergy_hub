part of 'matches_bloc.dart';

enum MatchesStatus {
  initial,
  loading,
  foundMatch,
  failed,
}

@freezed
sealed class MatchesState with _$MatchesState {
  const factory MatchesState({
    @Default(MatchesStatus.initial) MatchesStatus status,
    @Default('') String errorMessage,
    Matches? userMatch,
    UserData? lastFailedUser,
  }) = _MatchesState;
}