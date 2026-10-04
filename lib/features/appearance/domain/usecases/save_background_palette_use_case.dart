import 'package:dartz/dartz.dart';

import '../../../../core/failures/failure.dart';
import '../../../auth/domain/repostories/i_auth_repository.dart';
import '../exceptions/background_palette_premium_required_exception.dart';
import '../failures/background_palette_failures.dart';
import '../models/background_palette/background_palette.dart';
import '../repositories/i_background_palette_local_repository.dart';
import '../repositories/i_background_palette_repository.dart';

/// Server first: the `setBackgroundPalette` callable validates premium, and
/// only the palette it actually stored is cached locally — a rejected
/// palette never reaches the local copy. `null` resets to the default.
class SaveBackgroundPaletteUseCase {
  final IBackgroundPaletteLocalRepository _localRepository;
  final IBackgroundPaletteRepository _remoteRepository;
  final IAuthRepository _authRepository;

  SaveBackgroundPaletteUseCase({
    required this._localRepository,
    required this._remoteRepository,
    required this._authRepository,
  });

  Future<Either<BackgroundPalette?, Failure>> call({
    required BackgroundPalette? palette,
  }) async {
    try {
      final uid = await _authRepository.requireUserId();
      final stored = await _remoteRepository.set(palette: palette);
      await _localRepository.save(uid: uid, palette: stored);
      return Left(stored);
    } on BackgroundPalettePremiumRequiredException {
      return const Right(PremiumRequiredBackgroundPaletteFailure());
    } catch (_) {
      return const Right(SaveBackgroundPaletteFailure());
    }
  }
}
