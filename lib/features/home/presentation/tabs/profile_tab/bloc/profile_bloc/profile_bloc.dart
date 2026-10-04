import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../subscription/domain/usecases/get_subscription_management_url_use_case.dart';

import '../../../../../../user/domain/usecases/delete_account_use_case.dart';

part 'profile_event.dart';

part 'profile_state.dart';

part 'profile_bloc.freezed.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final DeleteAccountUseCase _deleteAccountUseCase;
  final GetSubscriptionManagementUrlUseCase
  _getSubscriptionManagementUrlUseCase;

  ProfileBloc({
    required DeleteAccountUseCase deleteAccountUseCase,
    required this._getSubscriptionManagementUrlUseCase,
  }) : _deleteAccountUseCase = deleteAccountUseCase,
       super(const ProfileState()) {
    on<_DeleteAccount>(_deleteAccount);
    on<_ManageSubscription>(
      _manageSubscription,
      transformer: droppable(),
    );
  }

  Future<void> _manageSubscription(
    _ManageSubscription event,
    Emitter<ProfileState> emit,
  ) async {
    emit(
      state.copyWith(
        status: EProfileStatus.openingSubscription,
      ),
    );

    final result = await _getSubscriptionManagementUrlUseCase.call();

    result.fold(
      (url) => emit(
        state.copyWith(
          status: EProfileStatus.subscriptionUrlReady,
          subscriptionManagementUrl: url,
        ),
      ),
      (failure) => emit(
        state.copyWith(
          status: EProfileStatus.subscriptionUrlFailed,
          errorMessage: failure.message,
        ),
      ),
    );
  }

  Future<void> _deleteAccount(
    _DeleteAccount event,
    Emitter<ProfileState> emit,
  ) async {
    if (state.isDeleting) return;

    emit(
      state.copyWith(
        status: EProfileStatus.deleting,
      ),
    );

    final result = await _deleteAccountUseCase();

    result.fold(
      (failure) => emit(
        state.copyWith(
          status: EProfileStatus.deleteFailed,
          errorMessage: failure.message,
        ),
      ),
      (_) => emit(
        state.copyWith(
          status: EProfileStatus.deleted,
        ),
      ),
    );
  }
}
