part of 'edit_profile_page_bloc.dart';

enum EditProfilePageStatus {
  initial,
  loading,
  failed,
  updated,
}

extension EditProfilePageStateX on EditProfilePageState {
  bool get isFailed => status == EditProfilePageStatus.failed;

  bool get isLoading => status == EditProfilePageStatus.loading;

  bool get isUpdated => status == EditProfilePageStatus.updated;

}

@freezed
sealed class EditProfilePageState with _$EditProfilePageState {
  const factory EditProfilePageState({
    @Default(EditProfilePageStatus.initial) EditProfilePageStatus status,
    @Default([]) List<Skill> skills,
    UserData? userData,
    @Default([]) List<String> availableSkills,
    @Default('') errorMessage,
  }) = _EditProfilePageState;
}
