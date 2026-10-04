import '../models/premium_status/premium_status.dart';
import '../repositories/i_premium_status_repository.dart';

/// The signed-in user's premium status, live across sign-in / sign-out.
/// `null` means Free (signed out, or no `subscriptions/{uid}` document).
class WatchCurrentPremiumStatusUseCase {
  final IPremiumStatusRepository _premiumStatusRepository;

  WatchCurrentPremiumStatusUseCase({
    required this._premiumStatusRepository,
  });

  Stream<PremiumStatus?> call() => _premiumStatusRepository.watchCurrent();
}
