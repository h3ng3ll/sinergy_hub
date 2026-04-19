
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../matches/domain/models/matches_filter/matches_filter.dart';

class UserQueryBuilder {
  static Query applyFilters(
      Query query,
      MatchesFilter? filter,
      ) {
    if (filter == null || !filter.isApplied) return query;

    if (filter.experience != null) {
      query = query.where(
        'profiler.experience',
        isEqualTo: filter.experience!.name,
      );
    }

    if (filter.specialization != null) {
      query = query.where(
        'profiler.specialization',
        isEqualTo: filter.specialization!.name,
      );
    }

    if (filter.skills.isNotEmpty) {
      query = query.where(
        'profiler.skills',
        arrayContainsAny: filter.skills.map((e) => e.name),
      );
    }

    return query;
  }
}