part of 'matches_bloc.dart';

enum MatchesStatus {
  initial,
  loading,
  foundMatch,
  failed,

  /// The daily free-match limit was hit — the backend rejected the like/
  /// dislike without recording it. Distinct from [failed] so the listener
  /// can open the paywall instead of showing an error toast.
  limitReached,
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