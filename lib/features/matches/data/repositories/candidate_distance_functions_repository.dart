import '../../../../core/services/firebase/firebase_functions_service.dart';
import '../../../../core/services/logger_service.dart';
import '../../domain/repositories/i_candidate_distance_repository.dart';

class CandidateDistanceFunctionsRepository
    implements ICandidateDistanceRepository {
  final FirebaseFunctionsService _firebaseFunctionsService;
  final LoggerService _loggerService;

  CandidateDistanceFunctionsRepository({
    required FirebaseFunctionsService firebaseFunctionsService,
    required LoggerService loggerService,
  }) : _firebaseFunctionsService = firebaseFunctionsService,
       _loggerService = loggerService;

  static const String _functionName = 'getCandidateDistances';

  /// Firestore-style limit the callable enforces server-side; the client
  /// chunks larger uid lists into calls of at most this size.
  static const int _maxUidsPerCall = 20;

  @override
  Future<Map<String, double?>> getDistances({
    required List<String> uids,
  }) async {
    if (uids.isEmpty) return {};

    final distances = <String, double?>{};

    for (var i = 0; i < uids.length; i += _maxUidsPerCall) {
      final chunk = uids.sublist(
        i,
        (i + _maxUidsPerCall).clamp(0, uids.length),
      );

      try {
        final dynamic rawResult = await _firebaseFunctionsService.call(
          functionName: _functionName,
          data: {
            'uids': chunk,
          },
        );

        if (rawResult is! Map) continue;
        final rawDistances = rawResult['distances'];
        if (rawDistances is! Map) continue;

        rawDistances.forEach((key, value) {
          distances[key.toString()] = (value as num?)?.toDouble();
        });
      } catch (e) {
        // Non-fatal — a distance failure never blocks the deck (§3,
        // "Client handling"). The uids in this chunk simply show no
        // distance.
        _loggerService.warning(
          'Failed to fetch candidate distances',
          error: e,
        );
      }
    }

    return distances;
  }
}
