import 'package:dartz/dartz.dart';

import '../../../../core/models/exceptions.dart';
import '../../../auth/domain/repostories/i_auth_repository.dart';
import '../models/liked_you_pg_state/liked_you_pg_state.dart';
import '../repositories/i_liked_you_local_repository.dart';
import '../repositories/i_liked_you_repository.dart';

/// Fetches the first Liked you page and writes it to the cache only when its
/// frame differs from the cached one. An identical frame leaves the cache —
/// and therefore the screen — untouched.
class SyncLikedYouUseCase {
  final ILikedYouRepository _likedYouRepository;
  final ILikedYouLocalRepository _localRepository;
  final IAuthRepository _authRepository;

  SyncLikedYouUseCase({
    required this._likedYouRepository,
    required this._localRepository,
    required this._authRepository,
  });

  Future<Either<void, Exceptions>> call() async {
    final uid = await _authRepository.requireUserId();
    final result = await _likedYouRepository.get(
      state: const LikedYouPgState(),
    );

    return result.fold(
      (fresh) async {
        final cached = await _localRepository.get(uid: uid);
        if (cached == null || !_isSameFrame(cached, fresh)) {
          await _localRepository.replace(uid: uid, page: fresh);
        }
        return const Left(null);
      },
      (failure) => Right(failure),
    );
  }

  /// The cursor is opaque and may change between identical answers, so it
  /// does not count as a difference.
  bool _isSameFrame(LikedYouPgState cached, LikedYouPgState fresh) =>
      cached.items == fresh.items &&
      cached.hasMore == fresh.hasMore &&
      cached.totalCount == fresh.totalCount &&
      cached.quota == fresh.quota;
}
