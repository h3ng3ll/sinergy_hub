part of 'profile_bloc.dart';

enum EProfileStatus {
  initial,
  deleting,
  deleted,
  deleteFailed,
  openingSubscription,
  subscriptionUrlReady,
  subscriptionUrlFailed,
}

extension ProfileStateX on ProfileState {
  bool get isDeleting => status == EProfileStatus.deleting;
  bool get isDeleted => status == EProfileStatus.deleted;
  bool get isDeleteFailed => status == EProfileStatus.deleteFailed;
  bool get isOpeningSubscription =>
      status == EProfileStatus.openingSubscription;
  bool get isSubscriptionUrlReady =>
      status == EProfileStatus.subscriptionUrlReady;
  bool get isSubscriptionUrlFailed =>
      status == EProfileStatus.subscriptionUrlFailed;
}

@freezed
sealed class ProfileState with _$ProfileState {
  const factory ProfileState({
    @Default(EProfileStatus.initial) EProfileStatus status,
    @Default('') String errorMessage,

    /// Set with [EProfileStatus.subscriptionUrlReady]; the page opens it.
    Uri? subscriptionManagementUrl,
  }) = _ProfileState;
}
