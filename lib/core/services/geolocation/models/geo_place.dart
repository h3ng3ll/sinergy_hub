import 'package:freezed_annotation/freezed_annotation.dart';

part 'geo_place.freezed.dart';

/// A reverse-geocoded place. `null` on web or when reverse geocoding fails —
/// the caller still has the [GeoPosition] in that case.
@freezed
sealed class GeoPlace with _$GeoPlace {
  const factory GeoPlace({
    String? country,
    String? countryCode,
    String? city,
  }) = _GeoPlace;
}
