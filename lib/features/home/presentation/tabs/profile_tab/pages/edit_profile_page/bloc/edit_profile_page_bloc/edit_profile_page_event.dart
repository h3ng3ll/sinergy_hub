part of 'edit_profile_page_bloc.dart';

@freezed
sealed class EditProfilePageEvent with _$EditProfilePageEvent {
  const factory EditProfilePageEvent.addSkill({
    required String name,
  }) = _AddSkill;

  const factory EditProfilePageEvent.initialize({
    required String uid,
  }) = _Initialize;

  const factory EditProfilePageEvent.removeSkill({
    required Skill skill,
  }) = _RemoveSkill;

  const factory EditProfilePageEvent.applyChanges({
    required String name,
    required String bio,
  }) = _ApplyChanges;
}
