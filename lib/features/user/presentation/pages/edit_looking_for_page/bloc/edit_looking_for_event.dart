part of 'edit_looking_for_bloc.dart';

@freezed
class EditLookingForEvent with _$EditLookingForEvent {
  const factory EditLookingForEvent.init() = _Init;

  const factory EditLookingForEvent.toggleSpecialization({
    required ESpecialization specialization,
  }) = _ToggleSpecialization;

  const factory EditLookingForEvent.save() = _Save;
}