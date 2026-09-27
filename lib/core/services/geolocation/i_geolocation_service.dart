import 'package:dartz/dartz.dart';

import 'failures/geo_failures.dart';
import 'models/e_geo_permission.dart';
import 'models/e_geo_settings_target.dart';
import 'models/geo_place.dart';
import 'models/geo_position.dart';

/// Abstraction over the device's location capabilities. This is the ONE
/// interface-typed core service in the project — every other core service is
/// registered as a concrete class. It exists so use cases never talk to
/// `geolocator` / `geocoding` directly.
abstract class IGeolocationService {
  /// Left = the granted access level. Right = why location can't be used,
  /// with a user-facing message and the settings screen that fixes it.
  Future<Either<EGeoPermission, GeoFailure>> requestPermission();

  Future<GeoPosition> currentPosition();

  /// Returns `null` on web or when reverse geocoding fails — the caller
  /// still has the position in that case.
  Future<GeoPlace?> reverseGeocode(GeoPosition position);

  Future<void> openSettings(EGeoSettingsTarget target);
}
