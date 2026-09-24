import '../models/premium_status/premium_status.dart';
import '../repositories/i_premium_status_repository.dart';

class WatchPremiumStatusUseCase {
  final IPremiumStatusRepository _premiumStatusRepository;

  WatchPremiumStatusUseCase({
    required this._premiumStatusRepository,
  });

  Stream<PremiumStatus?> call({required String uid}) =>
      _premiumStatusRepository.watch(uid);
}
