part of 'user_matches_outcome_cubit.dart';


enum UserMatchesOutcomeStatus {
  initial,
  loading,
  loaded,
  failed,
  foundMatch,
}

@freezed
sealed class  UserMatchesOutcomeState with _$UserMatchesOutcomeState {

  const factory  UserMatchesOutcomeState({
    @Default( UserMatchesOutcomeStatus.initial)  UserMatchesOutcomeStatus status,
    @Default('') errorMessage,
    @Default([]) List<UserMatch> userMatches,
    UserMatch? activeMatch,
  }) = _UserMatchesOutcomeState;
}
