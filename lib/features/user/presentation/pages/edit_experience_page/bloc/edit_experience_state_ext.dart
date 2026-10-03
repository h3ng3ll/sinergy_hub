part of 'edit_experience_bloc.dart';

extension EditExperienceStateX on EditExperienceState {
  bool get isInitial => status == EEditExperienceStatus.initial;

  bool get isLoading => status == EEditExperienceStatus.loading;

  bool get isLoaded => status == EEditExperienceStatus.loaded;

  bool get isSaving => status == EEditExperienceStatus.saving;

  bool get isSaved => status == EEditExperienceStatus.saved;

  bool get isFailed => status == EEditExperienceStatus.failed;

  bool get hasChanges =>
      selectedExperience != null &&
      selectedExperience != userData?.profiler.experience;
}
