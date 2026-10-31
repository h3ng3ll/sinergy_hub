import 'i_reverse_geocoding_service.dart';
import 'models/geo_place.dart';
import 'models/geo_position.dart';

/// Web has no reverse geocoding — location auto-detect is not offered there,
/// so the user types country / city manually.
class WebReverseGeocodingService implements IReverseGeocodingService {
  @override
  Future<GeoPlace?> placeFrom(GeoPosition position) async => null;
}
