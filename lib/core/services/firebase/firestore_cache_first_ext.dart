import 'package:cloud_firestore/cloud_firestore.dart';

/// Reads served from Firestore's on-device cache when it can answer, falling
/// back to the server otherwise (cache miss, incomplete result, or no
/// persistence — e.g. web). Callers that need guaranteed-fresh data pass
/// `preferCache: false` and always hit the server.
extension DocRefCacheFirst on DocumentReference<Map<String, dynamic>> {
  Future<DocumentSnapshot<Map<String, dynamic>>> getCacheFirst({
    bool preferCache = true,
  }) async {
    if (preferCache) {
      try {
        final cached = await get(
          const GetOptions(source: Source.cache),
        );
        if (cached.exists) return cached;
      } on FirebaseException catch (_) {
        // Not cached yet: fall through to the server.
      }
    }
    return get();
  }
}

extension QueryCacheFirst on Query<Map<String, dynamic>> {
  /// [expectedCount] is how many documents a complete answer has; a cached
  /// result with fewer is treated as a miss.
  Future<QuerySnapshot<Map<String, dynamic>>> getCacheFirst({
    required int expectedCount,
    bool preferCache = true,
  }) async {
    if (preferCache) {
      try {
        final cached = await get(
          const GetOptions(source: Source.cache),
        );
        if (cached.docs.length >= expectedCount) return cached;
      } on FirebaseException catch (_) {
        // Not cached yet: fall through to the server.
      }
    }
    return get();
  }
}
