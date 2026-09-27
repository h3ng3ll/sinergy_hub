import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/services/geolocation/models/geo_place.dart';
import '../../../../../core/services/geolocation/models/geo_position.dart';

part 'detected_location.freezed.dart';

/// Result of a single "Use my location" detection: the raw position (sent
/// to the backend) plus the reverse-geocoded place, if any (used to fill
/// the Country/City text fields). Transient — never persisted or JSON'd.
@freezed
sealed class DetectedLocation with _$DetectedLocation {
  const factory DetectedLocation({
    required GeoPosition position,
    GeoPlace? place,
  }) = _DetectedLocation;
}
