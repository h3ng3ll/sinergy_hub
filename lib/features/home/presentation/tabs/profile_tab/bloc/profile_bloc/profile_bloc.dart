import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../user/domain/usecases/delete_account_use_case.dart';

part 'profile_event.dart';

part 'profile_state.dart';

part 'profile_bloc.freezed.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final DeleteAccountUseCase _deleteAccountUseCase;

  ProfileBloc({
    required DeleteAccountUseCase deleteAccountUseCase,
  }) : _deleteAccountUseCase = deleteAccountUseCase,
       super(const ProfileState()) {
    on<_DeleteAccount>(_deleteAccount);
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
