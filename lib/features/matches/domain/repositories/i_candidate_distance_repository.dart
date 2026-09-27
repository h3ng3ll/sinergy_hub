/// `getCandidateDistances` — see `docs/location_backend_contract.md` §3.
abstract class ICandidateDistanceRepository {
  /// uid → distance in km, or `null` when unknown. Chunks internally when
  /// [uids] exceeds the callable's 20-uid limit.
  Future<Map<String, double?>> getDistances({
    required List<String> uids,
  });
}
