import '../../../../core/databases/hive_database.dart';
import '../../domain/models/background_palette/background_palette.dart';
import '../../domain/repositories/i_background_palette_local_repository.dart';
import '../models/background_palette_cache/background_palette_cache.dart';

/// Hive-backed [IBackgroundPaletteLocalRepository]: one `background_palettes`
/// box keyed by uid, kept across sign-outs.
class BackgroundPaletteHiveRepository
    implements IBackgroundPaletteLocalRepository {
  final HiveDatabase _hiveDatabase;

  BackgroundPaletteHiveRepository({
    required this._hiveDatabase,
  });

  final _boxName = 'background_palettes';

  @override
  Future<bool> has({
    required String uid,
  }) async {
    final box = await _hiveDatabase.getBox<BackgroundPaletteCache>(_boxName);
    return box.containsKey(uid);
  }

  @override
  Future<BackgroundPalette?> get({
    required String uid,
  }) async {
    final box = await _hiveDatabase.getBox<BackgroundPaletteCache>(_boxName);
    return box.get(uid)?.toPalette();
  }

  @override
  Future<void> save({
    required String uid,
    required BackgroundPalette? palette,
  }) async {
    final box = await _hiveDatabase.getBox<BackgroundPaletteCache>(_boxName);
    await box.put(uid, BackgroundPaletteCache.fromPalette(palette));
  }
}
