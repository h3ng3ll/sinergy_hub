import 'package:dartz/dartz.dart';

import '../../../../core/models/exceptions.dart';
import '../../../../core/services/geolocation/failures/geo_failures.dart';
import '../../../../core/services/geolocation/i_geolocation_service.dart';
import '../../../../core/services/geolocation/i_reverse_geocoding_service.dart';
import '../models/detected_location/detected_location.dart';

/// Chains permission → position → reverse-geocode behind the geolocation
/// abstraction. Left = success (reversed dartz polarity used across this
/// project), Right = a typed [GeoFailure] carrying the user-facing message and
/// the settings screen that fixes it.
class DetectCurrentLocationUseCase {
  final IGeolocationService _geolocationService;
  final IReverseGeocodingService _reverseGeocodingService;

  DetectCurrentLocationUseCase({
    required this._geolocationService,
    required this._reverseGeocodingService,
  });

  Future<Either<DetectedLocation, Exceptions>> call() async {
    final permission = await _geolocationService.requestPermission();

    return permission.fold(
      (_) async {
        try {
          final position = await _geolocationService.currentPosition();
          final place = await _reverseGeocodingService.placeFrom(position);
          return Left(
            DetectedLocation(
              position: position,
              place: place,
            ),
          );
        } catch (_) {
          return const Right(GeoPositionUnavailableFailure());
        }
      },
      (failure) async => Right(failure),
    );
  }
}
