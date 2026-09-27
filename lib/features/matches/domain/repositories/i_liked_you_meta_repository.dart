import '../models/liked_you_meta/liked_you_meta.dart';

abstract class ILikedYouMetaRepository {
  /// Emits `null` while the signed-in user has no `likedYouMeta/{uid}`
  /// document yet.
  Stream<LikedYouMeta?> watch();
}
