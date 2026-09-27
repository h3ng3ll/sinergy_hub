part of 'edit_profile_page_bloc.dart';

enum EditProfilePageStatus {
  initial,
  loading,
  failed,
  updated,
  updating,
}

extension EditProfilePageStateX on EditProfilePageState {
  bool get isFailed => status == EditProfilePageStatus.failed;

  bool get isLoading => status == EditProfilePageStatus.loading;

  bool get isUpdated => status == EditProfilePageStatus.updated;
  bool get isUpdating => status == EditProfilePageStatus.updating;
}

@freezed
sealed class EditProfilePageState with _$EditProfilePageState {
  const factory EditProfilePageState({
    @Default(EditProfilePageStatus.initial) EditProfilePageStatus status,
    @Default([]) List<Skill> skills,
    UserData? userData,
    @Default('') String errorMessage,

    /// Set once a GPS position is detected in this session. Used at Save
    /// time to decide whether `updateUserCoordinates` should also be
    /// called — never used to set `location.hasCoordinates` (backend-owned).
    GeoPosition? detectedPosition,

    /// The reverse-geocoded place for [detectedPosition], if any. A
    /// `BlocListener` fills the Country/City text fields from this.
    GeoPlace? detectedPlace,
    @Default(false) bool isDetectingLocation,
    @Default('') String locationError,

    /// The settings screen that fixes [locationError], when one exists.
    EGeoSettingsTarget? locationSettingsTarget,
  }) = _EditProfilePageState;
}
