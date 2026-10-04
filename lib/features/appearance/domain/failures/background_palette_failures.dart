import '../../../../core/failures/failure.dart';

class LoadBackgroundPaletteFailure extends Failure {
  const LoadBackgroundPaletteFailure([
    super.message = 'Failed to load your background colors.',
  ]);
}

class SaveBackgroundPaletteFailure extends Failure {
  const SaveBackgroundPaletteFailure([
    super.message = "Couldn't save your background colors. Try again.",
  ]);
}

/// The server refused because the user is not premium.
class PremiumRequiredBackgroundPaletteFailure extends Failure {
  const PremiumRequiredBackgroundPaletteFailure([
    super.message = 'Background colors are a Premium feature.',
  ]);
}
