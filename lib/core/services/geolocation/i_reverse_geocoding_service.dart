import 'models/geo_place.dart';
import 'models/geo_position.dart';

/// Turns coordinates into a human-readable place (country / city).
///
/// Kept separate from [IGeolocationService] because the backing package
/// (`geocoding`) has no web implementation — DI picks a per-platform
/// implementation so web never constructs it.
abstract class IReverseGeocodingService {
  /// `null` when the place can't be resolved; the caller still has the
  /// position in that case.
  Future<GeoPlace?> placeFrom(GeoPosition position);
}
