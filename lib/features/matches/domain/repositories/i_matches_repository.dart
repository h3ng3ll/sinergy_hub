import '../../data/models/matches_dto/matches_dto.dart';
import '../models/matches_filter/matches_filter.dart';

abstract class IMatchesRepository {
  /// Listen for new two-way matches
  Stream<MatchesDto?> listenTwoWayMatch({
    required String uid,
  });

  /// Try to Get incoming matches by Id
  Future<MatchesDto?> getById({
    required String uid,
  });

  /// return Uids of matched users
  /// accept uid of current user
  Future<List<String>> getUids({
    required String uid,
  });

  /// Notify and unsubscribe from receiving already read match
  Future<void> markAsNotified({
    required String matchId,
    required String uid,
  });

  Future<List<String>> getUidsWhereIncludeUser({
    required String uid,
  });
}
