import 'dart:convert';

import '../../../../core/databases/hive_database.dart';
import '../../../user/domain/models/users_data_pg_state/users_data_pg_state.dart';
import '../../domain/models/matches_filter/matches_filter.dart';
import '../../domain/repositories/i_discovery_deck_local_repository.dart';
import '../models/discovery_deck_cache/discovery_deck_cache.dart';

/// Hive-backed [IDiscoveryDeckLocalRepository]: one `discovery_decks` box,
/// keyed `'$uid|$filterKey'`.
class DiscoveryDeckHiveRepository implements IDiscoveryDeckLocalRepository {
  final HiveDatabase _hiveDatabase;

  DiscoveryDeckHiveRepository({
    required this._hiveDatabase,
  });

  final _boxName = 'discovery_decks';

  @override
  Future<UserDataPgState?> get({
    required String uid,
    required MatchesFilter filter,
  }) async {
    final box = await _hiveDatabase.getBox<DiscoveryDeckCache>(_boxName);
    return box.get(_key(uid, filter))?.toPgState();
  }

  @override
  Future<void> save({
    required String uid,
    required MatchesFilter filter,
    required UserDataPgState deck,
  }) async {
    final box = await _hiveDatabase.getBox<DiscoveryDeckCache>(_boxName);
    final key = _key(uid, filter);
    if (deck.items.isEmpty) {
      await box.delete(key);
      return;
    }
    await box.put(key, DiscoveryDeckCache.fromPgState(deck));
  }

  @override
  Future<void> removeUser({
    required String uid,
    required String userUid,
  }) async {
    final box = await _hiveDatabase.getBox<DiscoveryDeckCache>(_boxName);
    final prefix = '$uid|';
    for (final key in box.keys.whereType<String>().toList()) {
      if (!key.startsWith(prefix)) continue;
      final deck = box.get(key);
      if (deck == null || !deck.items.any((u) => u.uid == userUid)) continue;

      final items = [
        for (final u in deck.items)
          if (u.uid != userUid) u,
      ];
      if (items.isEmpty) {
        await box.delete(key);
      } else {
        await box.put(key, deck.copyWith(items: items));
      }
    }
  }

  /// Stable per-filter key: skills are sorted so the same selection made in
  /// a different order hits the same entry.
  String _key(String uid, MatchesFilter filter) {
    final skills = [...filter.skills]..sort((a, b) => a.name.compareTo(b.name));
    final filterKey = jsonEncode(filter.copyWith(skills: skills).toJson());
    return '$uid|$filterKey';
  }
}
