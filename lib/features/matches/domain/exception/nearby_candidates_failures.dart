/// The caller has no stored coordinates yet — `failed-precondition` from
/// `searchNearbyCandidates` (`docs/location_backend_contract.md` §4). The
/// deck shows this message and its error/empty state; it never crashes.
class NearbyCandidatesNoCoordinatesException implements Exception {
  final String message;

  const NearbyCandidatesNoCoordinatesException([
    this.message = 'Set your location in Edit Profile first.',
  ]);

  @override
  String toString() => message;
}

/// Any other `searchNearbyCandidates` failure (bad radius, rate limit,
/// network, internal). The deck shows its generic error state.
class NearbyCandidatesFailure implements Exception {
  final String message;

  const NearbyCandidatesFailure([
    this.message = 'Could not search nearby candidates. Please try again.',
  ]);

  @override
  String toString() => message;
}
