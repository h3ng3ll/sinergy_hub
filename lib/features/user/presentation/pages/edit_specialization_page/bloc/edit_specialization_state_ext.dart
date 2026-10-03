part of 'edit_specialization_bloc.dart';

extension EditSpecializationStateX on EditSpecializationState {
  bool get isInitial => status == EEditSpecializationStatus.initial;

  bool get isLoading => status == EEditSpecializationStatus.loading;

  bool get isLoaded => status == EEditSpecializationStatus.loaded;

  bool get isSaving => status == EEditSpecializationStatus.saving;

  bool get isSaved => status == EEditSpecializationStatus.saved;

  bool get isFailed => status == EEditSpecializationStatus.failed;

  bool get hasChanges =>
      selectedSpecialization != null &&
      selectedSpecialization != userData?.profiler.specialization;
}
