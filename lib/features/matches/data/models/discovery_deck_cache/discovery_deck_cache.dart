import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../user/domain/models/user_data/user_data.dart';
import '../../../../user/domain/models/users_data_pg_state/users_data_pg_state.dart';

part 'discovery_deck_cache.freezed.dart';

/// Locally cached, not-yet-swiped discovery deck of one user for one filter.
@freezed
sealed class DiscoveryDeckCache with _$DiscoveryDeckCache {
  const DiscoveryDeckCache._();

  const factory DiscoveryDeckCache({
    @Default(<UserData>[]) List<UserData> items,
    @Default(true) bool hasMore,
    String? lastDocumentId,
    String? cursor,
    @Default(<String, double>{}) Map<String, double> distancesKm,
  }) = _DiscoveryDeckCache;

  factory DiscoveryDeckCache.fromPgState(UserDataPgState deck) =>
      DiscoveryDeckCache(
        items: deck.items,
        hasMore: deck.hasMore,
        lastDocumentId: deck.lastDocumentId,
        cursor: deck.cursor,
        distancesKm: deck.distancesKm,
      );

  UserDataPgState toPgState() => UserDataPgState(
    items: items,
    hasMore: hasMore,
    lastDocumentId: lastDocumentId,
    cursor: cursor,
    distancesKm: distancesKm,
  );
}
