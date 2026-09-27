import 'package:dartz/dartz.dart';

import '../../../../core/models/exceptions.dart';
import '../../../../core/services/geolocation/models/geo_place.dart';
import '../../../../core/services/geolocation/models/geo_position.dart';

/// Write-only. There is no read counterpart: the backend never returns
/// coordinates to any client (`docs/location_backend_contract.md` §2).
abstract class IUserCoordinatesRepository {
  Future<Either<void, Exceptions>> updateCoordinates({
    required GeoPosition position,
    GeoPlace? place,
  });
}
