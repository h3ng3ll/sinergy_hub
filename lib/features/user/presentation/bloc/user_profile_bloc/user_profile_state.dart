part of 'user_profile_bloc.dart';

enum EUserProfileStatus {
  initial,
  loading,
  loaded,
  failed,
  noData,
}

extension UserProfileStateX on UserProfileState {
  bool get isLoading => status == EUserProfileStatus.loading;
  bool get isLoaded => status == EUserProfileStatus.loaded;
  bool get isFailed => status == EUserProfileStatus.failed;
  bool get isNoData => status == EUserProfileStatus.noData;
}

@freezed
sealed class UserProfileState with _$UserProfileState {
  const factory UserProfileState({
    UserData? userData,
    @Default(EUserProfileStatus.loading) EUserProfileStatus status,
    @Default('') String errorMessage,
  }) = _UserProfileState;
}
