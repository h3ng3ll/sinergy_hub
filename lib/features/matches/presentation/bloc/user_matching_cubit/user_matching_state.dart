part of 'user_matching_cubit.dart';

enum UserMatchingStatus {
  initial,
  loading,
  failed,
  foundMatch,
}

@freezed
sealed class UserMatchingState with _$UserMatchingState {
  const factory UserMatchingState({
    @Default([]) List<UserMatch> userMatches,
    @Default('') String errorMessage,
    UserMatch? activeMatch,
    @Default(UserMatchingStatus.loading) UserMatchingStatus status,
  }) = _UserMatchingState;
}
