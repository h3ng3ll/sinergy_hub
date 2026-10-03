part of 'edit_experience_bloc.dart';

@freezed
class EditExperienceEvent with _$EditExperienceEvent {
  const factory EditExperienceEvent.init() = _Init;

  const factory EditExperienceEvent.select({
    required EExperience experience,
  }) = _Select;

  const factory EditExperienceEvent.save() = _Save;
}
