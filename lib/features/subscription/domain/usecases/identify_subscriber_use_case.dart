import '../repositories/i_subscription_repository.dart';

/// Keeps RevenueCat's subscriber identity in sync with the signed-in
/// Firebase user — `logIn(uid)` on sign-in, `logOut()` on sign-out.
class IdentifySubscriberUseCase {
  final ISubscriptionRepository _subscriptionRepository;

  IdentifySubscriberUseCase({
    required this._subscriptionRepository,
  });

  Future<void> logIn(String uid) => _subscriptionRepository.logIn(uid);

  Future<void> logOut() => _subscriptionRepository.logOut();
}
