import '../models/liked_you_pg_state/liked_you_pg_state.dart';

/// Local, per-user cache of the first Liked you page.
abstract class ILikedYouLocalRepository {
  /// Emits the cached page right away, then on every change. Emits `null`
  /// while nothing has ever been cached for [uid], so callers can tell
  /// "not loaded yet" from "nobody liked you".
  Stream<LikedYouPgState?> watch({
    required String uid,
  });

  Future<LikedYouPgState?> get({
    required String uid,
  });

  /// Replaces the cached first page with a fresh backend page.
  Future<void> replace({
    required String uid,
    required LikedYouPgState page,
  });
}
