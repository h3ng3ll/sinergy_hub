part of 'edit_profile_page_bloc.dart';

enum EditProfilePageStatus {
  initial,
  loading,
  failed,
  updated,
}

@freezed
sealed class  EditProfilePageState with _$EditProfilePageState {

  const factory  EditProfilePageState({
    @Default( EditProfilePageStatus.initial)  EditProfilePageStatus status,
    @Default([]) List<Skill> skills,
    @Default('') errorMessage,
  }) = _EditProfilePageState;
}
