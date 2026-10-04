import 'dart:async';

import 'package:rxdart/rxdart.dart';

import '../../../auth/domain/repostories/i_auth_repository.dart';
import '../../../subscription/domain/repositories/i_premium_status_repository.dart';
import '../exception/liked_you_failures.dart';
import '../models/liked_you_feed_update/liked_you_feed_update.dart';
import '../repositories/i_liked_you_local_repository.dart';
import '../repositories/i_liked_you_meta_repository.dart';
import 'sync_liked_you_use_case.dart';

/// How long to wait for the first snapshot of both signal documents before
/// reporting a failure. A denied listener (missing Firestore rule) never
/// emits, so without this a cold start would spin forever.
const Duration _kFirstSnapshotTimeout = Duration(seconds: 10);

/// Cache-first Liked you feed.
///
/// The cached first page is emitted right away. In parallel, every state of
/// `subscriptions/{uid}` (created, updated, deleted) and every
/// `likedYouMeta/{uid}` change runs a backend sync, which rewrites the cache
/// only when the first-page frame differs — the new page then arrives here
/// through the cache watch. `switchMap` drops a sync made stale by a newer
/// change. Failures, listener errors and a missing first snapshot all arrive
/// as [LikedYouFeedUpdate.failed], so the stream never dies silently.
class WatchLikedYouUseCase {
  final ILikedYouLocalRepository _localRepository;
  final IPremiumStatusRepository _premiumStatusRepository;
  final ILikedYouMetaRepository _likedYouMetaRepository;
  final SyncLikedYouUseCase _syncLikedYouUseCase;
  final IAuthRepository _authRepository;

  WatchLikedYouUseCase({
    required this._localRepository,
    required this._premiumStatusRepository,
    required this._likedYouMetaRepository,
    required this._syncLikedYouUseCase,
    required this._authRepository,
  });

  Stream<LikedYouFeedUpdate> call() {
    return Rx.fromCallable(_authRepository.requireUserId)
        .switchMap(
          (uid) => Rx.merge<LikedYouFeedUpdate>([
            _localRepository
                .watch(uid: uid)
                .whereNotNull()
                .map(LikedYouFeedUpdate.page),
            _remoteSyncs(),
          ]),
        )
        .onErrorReturnWith(
          (error, _) => LikedYouFeedUpdate.failed(
            LoadLikedYouFailure(error.toString()),
          ),
        );
  }

  Stream<LikedYouFeedUpdate> _remoteSyncs() {
    final changes = Rx.combineLatest2(
      _premiumStatusRepository.watchCurrent().distinct(),
      _likedYouMetaRepository.watch().distinct(),
      (_, _) => null,
    ).share();

    return Rx.merge<LikedYouFeedUpdate>([
      changes.switchMap(
        (_) => Stream.fromFuture(_syncLikedYouUseCase.call()).map(
          (result) => result.fold(
            (_) => const LikedYouFeedUpdate.synced(),
            LikedYouFeedUpdate.failed,
          ),
        ),
      ),
      Rx.timer<LikedYouFeedUpdate>(
        LikedYouFeedUpdate.failed(
          LikedYouNetworkFailure('timed out waiting for live updates'),
        ),
        _kFirstSnapshotTimeout,
      ).takeUntil(changes),
    ]);
  }
}
