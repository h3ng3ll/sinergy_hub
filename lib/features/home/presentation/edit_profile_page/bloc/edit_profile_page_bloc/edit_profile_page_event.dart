part of 'edit_profile_page_bloc.dart';

@freezed
sealed class EditProfilePageEvent with _$EditProfilePageEvent {
  const factory EditProfilePageEvent.addSkill({
    required String name,
  }) = _AddSkill;

  const factory EditProfilePageEvent.initialize() = _Initialize;

  const factory EditProfilePageEvent.removeSkill({
    required Skill skill,
  }) = _RemoveSkill;

  const factory EditProfilePageEvent.applyChanges({
    String? firstName,
    String? lastName,
    String? aboutMe,
    Uint8List? img,
  }) = _ApplyChanges;
}
