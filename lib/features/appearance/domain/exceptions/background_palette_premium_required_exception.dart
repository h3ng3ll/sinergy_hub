/// `setBackgroundPalette` rejected a set because the caller is not premium
/// (`permission-denied`) — see docs/background_palette_backend_contract.md.
class BackgroundPalettePremiumRequiredException implements Exception {
  final String? message;

  const BackgroundPalettePremiumRequiredException([this.message]);
}
