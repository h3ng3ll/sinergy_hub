import '../../../models/exceptions.dart';
import '../models/e_geo_settings_target.dart';

/// A location failure the user can act on. [settingsTarget] names the
/// settings screen that fixes it, or `null` when simply trying again is the
/// only option.
abstract class GeoFailure extends Exceptions {
  final EGeoSettingsTarget? settingsTarget;

  const GeoFailure(super.message, {this.settingsTarget});
}

/// The device's Location Services (GPS) are switched off system-wide.
class GeoServiceDisabledFailure extends GeoFailure {
  const GeoServiceDisabledFailure(super.message)
    : super(settingsTarget: EGeoSettingsTarget.locationServices);
}

/// Permission was denied this time; asking again is still possible.
class GeoPermissionDeniedFailure extends GeoFailure {
  const GeoPermissionDeniedFailure()
    : super('Location permission was denied. Tap "Use my location" to allow it.');
}

/// Permission is permanently denied; only the app's settings page can
/// restore it.
class GeoPermissionPermanentlyDeniedFailure extends GeoFailure {
  const GeoPermissionPermanentlyDeniedFailure(super.message)
    : super(settingsTarget: EGeoSettingsTarget.appSettings);
}

/// Access is granted but no position could be read (timeout, no signal).
class GeoPositionUnavailableFailure extends GeoFailure {
  const GeoPositionUnavailableFailure()
    : super('Could not determine your location. Please try again.');
}
