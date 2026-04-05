part of 'user_profile_bloc.dart';

@freezed
sealed class UserProfileEvent with _$UserProfileEvent {
  const factory UserProfileEvent.initialize({
    required String userId,
  }) = _Initialize;
}
