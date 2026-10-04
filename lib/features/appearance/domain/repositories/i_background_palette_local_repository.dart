import '../models/background_palette/background_palette.dart';

/// Per-user local copy of the background palette.
abstract class IBackgroundPaletteLocalRepository {
  /// Whether anything is stored for [uid] — including "default", which is
  /// stored explicitly so a default user never re-reads the backend.
  Future<bool> has({
    required String uid,
  });

  /// `null` means the default palette.
  Future<BackgroundPalette?> get({
    required String uid,
  });

  /// [palette] `null` stores "default".
  Future<void> save({
    required String uid,
    required BackgroundPalette? palette,
  });
}
