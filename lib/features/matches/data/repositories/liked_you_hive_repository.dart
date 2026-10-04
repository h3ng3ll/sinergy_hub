import 'dart:async';

import '../../../../core/databases/hive_database.dart';
import '../../domain/models/liked_you_pg_state/liked_you_pg_state.dart';
import '../../domain/repositories/i_liked_you_local_repository.dart';
import '../models/liked_you_cache/liked_you_cache.dart';

/// Hive-backed [ILikedYouLocalRepository]: one `liked_you_pages` box, one
/// entry per user keyed by uid.
class LikedYouHiveRepository implements ILikedYouLocalRepository {
  final HiveDatabase _hiveDatabase;

  LikedYouHiveRepository({
    required this._hiveDatabase,
  });

  final _boxName = 'liked_you_pages';

  @override
  Stream<LikedYouPgState?> watch({
    required String uid,
  }) async* {
    final box = await _hiveDatabase.getBox<LikedYouCache>(_boxName);

    /// Subscribe to changes BEFORE reading the current value: a write landing
    /// between the read and the subscription would otherwise be lost.
    final controller = StreamController<LikedYouPgState?>();
    final subscription = box
        .watch(key: uid)
        .listen((_) => controller.add(box.get(uid)?.toPgState()));
    controller.add(box.get(uid)?.toPgState());
    try {
      yield* controller.stream;
    } finally {
      await subscription.cancel();
      await controller.close();
    }
  }

  @override
  Future<LikedYouPgState?> get({
    required String uid,
  }) async {
    final box = await _hiveDatabase.getBox<LikedYouCache>(_boxName);
    return box.get(uid)?.toPgState();
  }

  @override
  Future<void> replace({
    required String uid,
    required LikedYouPgState page,
  }) async {
    final box = await _hiveDatabase.getBox<LikedYouCache>(_boxName);
    await box.put(
      uid,
      LikedYouCache.fromPgState(page),
    );
  }
}
