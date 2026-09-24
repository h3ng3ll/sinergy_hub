part of 'premium_bloc.dart';

extension PremiumStateX on PremiumState {
  bool get isInitial => status == EPremiumStatus.initial;

  bool get isLoading => status == EPremiumStatus.loading;

  bool get isReady => status == EPremiumStatus.ready;

  bool get isFailed => status == EPremiumStatus.failed;
}
