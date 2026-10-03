part of 'edit_specialization_bloc.dart';

@freezed
class EditSpecializationEvent with _$EditSpecializationEvent {
  const factory EditSpecializationEvent.init() = _Init;

  const factory EditSpecializationEvent.select({
    required ESpecialization specialization,
  }) = _Select;

  const factory EditSpecializationEvent.save() = _Save;
}
