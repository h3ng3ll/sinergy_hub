import '../../../../core/models/exceptions.dart';

/// Anything that isn't one of the more specific failures below — an
/// `internal` code, an envelope that doesn't parse, or (until the backend
/// ships `getLikedYou`) a `not-found` callable.
class LoadLikedYouFailure implements Exceptions {
  @override
  final String message;

  LoadLikedYouFailure([String? details])
    : message = (details == null || details.isEmpty)
          ? 'Could not load who liked you. Please try again.'
          : 'Could not load who liked you: $details';
}

/// `unavailable`, `deadline-exceeded` or `resource-exhausted` — a
/// transient/backend issue the user can retry.
class LikedYouNetworkFailure implements Exceptions {
  @override
  final String message;

  LikedYouNetworkFailure([String? details])
    : message = (details == null || details.isEmpty)
          ? 'Check your connection and try again.'
          : 'Check your connection and try again: $details';
}

/// `unauthenticated`.
class LikedYouUnauthenticatedFailure implements Exceptions {
  @override
  final String message;

  LikedYouUnauthenticatedFailure([String? details])
    : message = (details == null || details.isEmpty)
          ? 'You need to sign in again to see who liked you.'
          : 'You need to sign in again: $details';
}

/// `invalid-argument` — a bad, foreign or expired pagination cursor. The
/// bloc branches on this with `is` to reset and reload from the first page
/// once (see `LikedYouBloc._loadMore`).
class LikedYouInvalidCursorFailure implements Exceptions {
  @override
  final String message;

  LikedYouInvalidCursorFailure([String? details])
    : message = (details == null || details.isEmpty)
          ? 'Your list needs a refresh.'
          : 'Your list needs a refresh: $details';
}
