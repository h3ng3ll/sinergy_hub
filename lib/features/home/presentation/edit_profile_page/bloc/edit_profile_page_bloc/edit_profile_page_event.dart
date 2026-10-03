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
    int? age,
    String? aboutMe,
    String? country,
    String? city,
    Uint8List? img,
  }) = _ApplyChanges;

  /// Runs permission → position → reverse-geocode and fills
  /// [EditProfilePageState.detectedPosition] / `.detectedPlace` on success.
  const factory EditProfilePageEvent.detectLocation() = _DetectLocation;
}
