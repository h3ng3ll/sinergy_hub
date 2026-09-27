import '../models/liked_you_meta/liked_you_meta.dart';
import '../repositories/i_liked_you_meta_repository.dart';

class WatchLikedYouChangesUseCase {
  final ILikedYouMetaRepository _likedYouMetaRepository;

  WatchLikedYouChangesUseCase({
    required this._likedYouMetaRepository,
  });

  /// Skips the first snapshot (the state at subscribe time, already covered
  /// by the initial load) and emits once per real change afterwards.
  Stream<LikedYouMeta?> call() =>
      _likedYouMetaRepository.watch().distinct().skip(1);
}
