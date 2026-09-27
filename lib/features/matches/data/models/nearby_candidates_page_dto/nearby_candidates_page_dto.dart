import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../user/domain/models/user_data/user_data.dart';
import '../../../../user/domain/models/users_data_pg_state/users_data_pg_state.dart';

part 'nearby_candidates_page_dto.freezed.dart';

/// The `searchNearbyCandidates` callable response envelope — see
/// `docs/location_backend_contract.md` §4.
///
/// Each response item carries the same public fields as `users/{uid}` PLUS
/// a sibling `distanceKm`, not a nested object — so this is parsed by hand
/// (`fromRaw`) rather than through `json_serializable`, splitting each item
/// into a [UserData] and its distance.
@freezed
sealed class NearbyCandidatesPageDto with _$NearbyCandidatesPageDto {
  const NearbyCandidatesPageDto._();

  const factory NearbyCandidatesPageDto({
    @Default(<UserData>[]) List<UserData> items,
    @Default({}) Map<String, double> distancesKm,
    String? nextCursor,
    @Default(false) bool hasMore,
  }) = _NearbyCandidatesPageDto;

  factory NearbyCandidatesPageDto.fromRaw(Map<dynamic, dynamic> raw) {
    final rawItems = raw['items'];
    final items = <UserData>[];
    final distancesKm = <String, double>{};

    if (rawItems is List) {
      for (final rawItem in rawItems) {
        if (rawItem is! Map) continue;
        final itemJson = _toFirestoreShape(rawItem);
        final distanceKm = (itemJson.remove('distanceKm') as num?)
            ?.toDouble();
        final user = UserData.fromJson(itemJson);
        items.add(user);
        if (distanceKm != null) {
          distancesKm[user.uid] = distanceKm;
        }
      }
    }

    return NearbyCandidatesPageDto(
      items: items,
      distancesKm: distancesKm,
      nextCursor: raw['nextCursor'] as String?,
      hasMore: raw['hasMore'] as bool? ?? false,
    );
  }

  /// `UserData.fromJson` expects the Firestore document shape: nested maps
  /// typed `Map<String, dynamic>` (the callable delivers
  /// `Map<Object?, Object?>` at every level) and `Timestamp` dates (its
  /// generated code casts `as Timestamp?` before the converter runs, so an
  /// ISO string would throw).
  static Map<String, dynamic> _toFirestoreShape(Map<dynamic, dynamic> raw) {
    final json = _deepStringKeyed(raw);
    for (final key in const ['createdAt', 'lastSeen']) {
      final value = json[key];
      if (value is String) {
        json[key] = Timestamp.fromDate(DateTime.parse(value));
      }
    }
    return json;
  }

  static Map<String, dynamic> _deepStringKeyed(Map<dynamic, dynamic> raw) => {
    for (final entry in raw.entries)
      entry.key.toString(): _deepValue(entry.value),
  };

  static dynamic _deepValue(dynamic value) {
    if (value is Map) return _deepStringKeyed(value);
    if (value is List) return [for (final e in value) _deepValue(e)];
    return value;
  }

  UserDataPgState toPgState(UserDataPgState state) => state.copyWith(
    items: [
      ...state.items,
      ...items,
    ],
    distancesKm: {
      ...state.distancesKm,
      ...distancesKm,
    },
    cursor: nextCursor,
    hasMore: hasMore,
  );
}
