part of 'premium_bloc.dart';

@freezed
class PremiumEvent with _$PremiumEvent {
  const factory PremiumEvent.init({
    required String uid,
  }) = _Init;

  const factory PremiumEvent.reset() = _Reset;
}
