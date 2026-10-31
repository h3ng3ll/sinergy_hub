import 'package:geocoding/geocoding.dart';

import 'i_reverse_geocoding_service.dart';
import 'models/geo_place.dart';
import 'models/geo_position.dart';

/// Android / iOS / macOS reverse geocoding via the OS geocoder.
class NativeReverseGeocodingService implements IReverseGeocodingService {
  /// Created on first use so constructing the service never touches the
  /// platform plugin.
  Geocoding? _client;

  Geocoding get _geocoding => _client ??= Geocoding();

  @override
  Future<GeoPlace?> placeFrom(GeoPosition position) async {
    try {
      final placemarks = await _geocoding.placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );
      if (placemarks.isEmpty) return null;
      final placemark = placemarks.first;
      return GeoPlace(
        country: placemark.country,
        countryCode: placemark.isoCountryCode,
        city: placemark.locality,
      );
    } catch (_) {
      return null;
    }
  }
}
