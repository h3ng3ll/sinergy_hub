import 'package:dartz/dartz.dart';

import 'failures/geo_failures.dart';
import 'models/e_geo_permission.dart';
import 'models/e_geo_settings_target.dart';
import 'models/geo_position.dart';

/// Abstraction over the device's location capabilities. This is the ONE
/// interface-typed core service in the project — every other core service is
/// registered as a concrete class. It exists so use cases never talk to
/// `geolocator` directly. Reverse geocoding lives in
/// `IReverseGeocodingService`.
abstract class IGeolocationService {
  /// Left = the granted access level. Right = why location can't be used,
  /// with a user-facing message and the settings screen that fixes it.
  Future<Either<EGeoPermission, GeoFailure>> requestPermission();

  Future<GeoPosition> currentPosition();

  Future<void> openSettings(EGeoSettingsTarget target);
}
