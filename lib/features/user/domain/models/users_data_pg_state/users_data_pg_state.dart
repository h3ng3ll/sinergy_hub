import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../user_data/user_data.dart';

part 'users_data_pg_state.freezed.dart';

@freezed
sealed class UserDataPgState with _$UserDataPgState {
  const factory UserDataPgState({
    @Default(0) int startIndex,
    @Default(10) int pageSize,
    @Default(true) bool hasMore,

    /// Firebase field
    DocumentSnapshot? lastDocument,

    /// Opaque backend cursor, used when the page comes from a callable
    /// (`searchNearbyCandidates`, radius mode) instead of a Firestore query.
    String? cursor,
    @Default({}) Set<String> excludedUids,
    @Default([]) List<UserData> items,

    /// uid → distance in km. Populated by `getCandidateDistances` (place
    /// mode / no filter) or embedded directly in a radius-mode search
    /// response. A missing key means no distance is known for that uid.
    @Default({}) Map<String, double> distancesKm,
  }) = _UsersDataPgState;
}
