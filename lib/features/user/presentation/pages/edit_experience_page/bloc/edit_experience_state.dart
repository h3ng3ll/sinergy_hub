part of 'edit_experience_bloc.dart';

enum EEditExperienceStatus {
  initial,
  loading,
  loaded,
  saving,
  saved,
  failed,
}

@freezed
sealed class EditExperienceState with _$EditExperienceState {
  const factory EditExperienceState({
    @Default(EEditExperienceStatus.initial) EEditExperienceStatus status,
    UserData? userData,
    EExperience? selectedExperience,
    @Default('') String errorMessage,
  }) = _EditExperienceState;
}
