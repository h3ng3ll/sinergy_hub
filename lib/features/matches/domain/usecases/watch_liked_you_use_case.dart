import 'package:dartz/dartz.dart';
import 'package:rxdart/rxdart.dart';

import '../../../../core/models/exceptions.dart';
import '../../../subscription/domain/repositories/i_premium_status_repository.dart';
import '../exception/liked_you_failures.dart';
import '../models/liked_you_pg_state/liked_you_pg_state.dart';
import '../repositories/i_liked_you_meta_repository.dart';
import '../repositories/i_liked_you_repository.dart';

/// How long to wait for the first snapshot of both signal documents before
/// reporting a failure. A denied listener (missing Firestore rule) never
/// emits, so without this the page would spin forever.
const Duration _kFirstSnapshotTimeout = Duration(seconds: 10);

/// The live Liked you feed: a fresh first page for every state of the
/// viewer's `subscriptions/{uid}` document (created, updated or deleted) and
/// for every `likedYouMeta/{uid}` change. Locking is decided by the server,
/// so each subscription change re-asks `getLikedYou`.
///
/// The first snapshot of both documents is the initial load — nothing is
/// skipped, so a change landing before the listeners attach is never lost.
/// `switchMap` drops a fetch made stale by a newer change. Fetch failures,
/// listener errors and a missing first snapshot all arrive as failure
/// values, so the caller always leaves its loading state.
class WatchLikedYouUseCase {
  final IPremiumStatusRepository _premiumStatusRepository;
  final ILikedYouMetaRepository _likedYouMetaRepository;
  final ILikedYouRepository _likedYouRepository;

  WatchLikedYouUseCase({
    required this._premiumStatusRepository,
    required this._likedYouMetaRepository,
    required this._likedYouRepository,
  });

  Stream<Either<LikedYouPgState, Exceptions>> call() {
    final changes = Rx.combineLatest2(
      _premiumStatusRepository.watchCurrent().distinct(),
      _likedYouMetaRepository.watch().distinct(),
      (_, _) => null,
    ).share();

    return Rx.merge<Either<LikedYouPgState, Exceptions>>([
      changes.switchMap(
        (_) => Stream.fromFuture(
          _likedYouRepository.get(
            state: const LikedYouPgState(),
          ),
        ),
      ),
      Rx.timer<Either<LikedYouPgState, Exceptions>>(
        Right(LikedYouNetworkFailure('timed out waiting for live updates')),
        _kFirstSnapshotTimeout,
      ).takeUntil(changes),
    ]).onErrorReturnWith(
      (error, _) => Right(LoadLikedYouFailure(error.toString())),
    );
  }
}
