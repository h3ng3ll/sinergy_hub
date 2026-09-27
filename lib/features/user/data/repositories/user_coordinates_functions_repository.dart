import 'package:dartz/dartz.dart';

import '../../../../core/models/exceptions.dart';
import '../../../../core/services/firebase/firebase_functions_service.dart';
import '../../../../core/services/geolocation/models/geo_place.dart';
import '../../../../core/services/geolocation/models/geo_position.dart';
import '../../../../core/services/logger_service.dart';
import '../../domain/failures/user_coordinates_failure.dart';
import '../../domain/repositories/i_user_coordinates_repository.dart';

class UserCoordinatesFunctionsRepository implements IUserCoordinatesRepository {
  final FirebaseFunctionsService _firebaseFunctionsService;
  final LoggerService _loggerService;

  UserCoordinatesFunctionsRepository({
    required FirebaseFunctionsService firebaseFunctionsService,
    required LoggerService loggerService,
  }) : _firebaseFunctionsService = firebaseFunctionsService,
       _loggerService = loggerService;

  static const String _functionName = 'updateUserCoordinates';

  @override
  Future<Either<void, Exceptions>> updateCoordinates({
    required GeoPosition position,
    GeoPlace? place,
  }) async {
    try {
      await _firebaseFunctionsService.call(
        functionName: _functionName,
        data: {
          'latitude': position.latitude,
          'longitude': position.longitude,
          'accuracyMeters': position.accuracyMeters,
          'capturedAt': position.capturedAt.toUtc().toIso8601String(),
          'country': place?.country,
          'countryCode': place?.countryCode,
          'city': place?.city,
        },
      );
      return Left(null);
    } catch (e) {
      _loggerService.error(
        'Failed to sync user coordinates',
        error: e,
      );
      return Right(const UpdateUserCoordinatesFailure());
    }
  }
}
