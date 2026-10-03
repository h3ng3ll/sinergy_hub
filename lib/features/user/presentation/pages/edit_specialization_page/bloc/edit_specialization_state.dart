part of 'edit_specialization_bloc.dart';

enum EEditSpecializationStatus {
  initial,
  loading,
  loaded,
  saving,
  saved,
  failed,
}

@freezed
sealed class EditSpecializationState with _$EditSpecializationState {
  const factory EditSpecializationState({
    @Default(EEditSpecializationStatus.initial) EEditSpecializationStatus status,
    UserData? userData,
    ESpecialization? selectedSpecialization,
    @Default('') String errorMessage,
  }) = _EditSpecializationState;
}
