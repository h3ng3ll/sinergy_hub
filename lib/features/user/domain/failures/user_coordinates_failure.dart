import '../../../../core/models/exceptions.dart';

/// A failed `updateUserCoordinates` call. Always non-fatal — the profile
/// itself is already saved by the time this runs (see
/// `docs/location_backend_contract.md` §2, "Client handling").
class UpdateUserCoordinatesFailure extends Exceptions {
  const UpdateUserCoordinatesFailure()
    : super('Location could not be synced.');
}
