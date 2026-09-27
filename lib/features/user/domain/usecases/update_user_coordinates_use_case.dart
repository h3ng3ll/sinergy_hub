import 'package:dartz/dartz.dart';

import '../../../../core/models/exceptions.dart';
import '../../../../core/services/geolocation/models/geo_place.dart';
import '../../../../core/services/geolocation/models/geo_position.dart';
import '../repositories/i_user_coordinates_repository.dart';

/// Sends a detected GPS position to the backend. Write-only — see
/// `docs/location_backend_contract.md` §2. Never touches Firestore
/// directly; the client never sets `location.hasCoordinates` itself.
class UpdateUserCoordinatesUseCase {
  final IUserCoordinatesRepository _userCoordinatesRepository;

  UpdateUserCoordinatesUseCase({
    required IUserCoordinatesRepository userCoordinatesRepository,
  }) : _userCoordinatesRepository = userCoordinatesRepository;

  Future<Either<void, Exceptions>> call({
    required GeoPosition position,
    GeoPlace? place,
  }) {
    return _userCoordinatesRepository.updateCoordinates(
      position: position,
      place: place,
    );
  }
}
