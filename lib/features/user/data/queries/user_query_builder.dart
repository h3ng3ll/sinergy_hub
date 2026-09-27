
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

    // Distance mode can't be expressed as a Firestore query — it has no
    // coordinates to compare against. It is handled entirely server-side by
    // `searchNearbyCandidates` (see UserFirebaseRepository.get).
    if (filter.isPlaceMode) {
      final countryKey = filter.country?.trim().toLowerCase();
      final cityKey = filter.city?.trim().toLowerCase();

      if (countryKey != null && countryKey.isNotEmpty) {
        query = query.where(
          'location.countryKey',
          isEqualTo: countryKey,
        );
      }

      if (cityKey != null && cityKey.isNotEmpty) {
        query = query.where(
          'location.cityKey',
          isEqualTo: cityKey,
        );
      }
    }

    return query;
  }
}