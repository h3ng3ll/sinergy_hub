part of 'profile_bloc.dart';

enum EProfileStatus {
  initial,
  deleting,
  deleted,
  deleteFailed,
}

extension ProfileStateX on ProfileState {
  bool get isDeleting => status == EProfileStatus.deleting;
  bool get isDeleted => status == EProfileStatus.deleted;
  bool get isDeleteFailed => status == EProfileStatus.deleteFailed;
}

@freezed
sealed class ProfileState with _$ProfileState {
  const factory ProfileState({
    @Default(EProfileStatus.initial) EProfileStatus status,
    @Default('') String errorMessage,
  }) = _ProfileState;
}
