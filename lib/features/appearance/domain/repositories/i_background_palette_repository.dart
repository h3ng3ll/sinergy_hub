import '../models/background_palette/background_palette.dart';

/// The backend copy of the background palette. Reads come straight from
/// `users/{uid}/appearance/palette`; writes go through the premium-validated
/// `setBackgroundPalette` callable — the client cannot write the document.
/// See docs/background_palette_backend_contract.md.
abstract class IBackgroundPaletteRepository {
  /// `null` when the user never picked a palette (or reset it).
  Future<BackgroundPalette?> get({
    required String uid,
  });

  /// Stores [palette] (`null` resets to the default) and returns what the
  /// server actually stored.
  ///
  /// Throws [BackgroundPalettePremiumRequiredException] when the server
  /// rejects a set because the caller is not premium.
  Future<BackgroundPalette?> set({
    required BackgroundPalette? palette,
  });
}
