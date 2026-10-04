part of 'profile_bloc.dart';

@freezed
sealed class ProfileEvent with _$ProfileEvent {
  const factory ProfileEvent.deleteAccount() = _DeleteAccount;

  /// Resolves the store page where the subscription is managed or cancelled.
  const factory ProfileEvent.manageSubscription() = _ManageSubscription;
}
