import 'package:dartz/dartz.dart';

import '../../../../core/failures/failure.dart';
import '../../../auth/domain/repostories/i_auth_repository.dart';
import '../failures/background_palette_failures.dart';
import '../models/background_palette/background_palette.dart';
import '../repositories/i_background_palette_local_repository.dart';
import '../repositories/i_background_palette_repository.dart';

/// Local first; the backend is read only when nothing is stored locally
/// (fresh install, new device), and its answer is then stored locally.
/// Left `null` = default palette.
class GetBackgroundPaletteUseCase {
  final IBackgroundPaletteLocalRepository _localRepository;
  final IBackgroundPaletteRepository _remoteRepository;
  final IAuthRepository _authRepository;

  GetBackgroundPaletteUseCase({
    required this._localRepository,
    required this._remoteRepository,
    required this._authRepository,
  });

  Future<Either<BackgroundPalette?, Failure>> call() async {
    try {
      final uid = await _authRepository.requireUserId();
      if (await _localRepository.has(uid: uid)) {
        return Left(await _localRepository.get(uid: uid));
      }

      final palette = await _remoteRepository.get(uid: uid);
      await _localRepository.save(uid: uid, palette: palette);
      return Left(palette);
    } catch (_) {
      return const Right(LoadBackgroundPaletteFailure());
    }
  }
}
