import 'package:freezed_annotation/freezed_annotation.dart';

part 'geo_position.freezed.dart';

/// A raw device position. Never persisted to Firestore and never sent
/// anywhere except through `updateUserCoordinates` — see
/// `docs/location_backend_contract.md`.
@freezed
sealed class GeoPosition with _$GeoPosition {
  const factory GeoPosition({
    required double latitude,
    required double longitude,
    double? accuracyMeters,
    required DateTime capturedAt,
  }) = _GeoPosition;
}
