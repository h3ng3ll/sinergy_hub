part of 'edit_looking_for_bloc.dart';

enum EditLookingForStatus {
  initial,
  loading,
  loaded,
  saving,
  saved,
  failed,
}

@freezed
sealed class EditLookingForState with _$EditLookingForState {
  const factory EditLookingForState({
    @Default(EditLookingForStatus.initial) EditLookingForStatus status,
    UserData? userData,
    @Default([]) List<ESpecialization> selectedSpecializations,
    @Default('') String errorMessage,
  }) = _EditLookingForState;
}
