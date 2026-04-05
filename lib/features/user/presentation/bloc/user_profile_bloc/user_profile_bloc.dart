import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/models/user_data/user_data.dart';
import '../../../domain/usecases/get_user_data_use_case.dart';

part 'user_profile_event.dart';

part 'user_profile_state.dart';

part 'user_profile_bloc.freezed.dart';

class UserProfileBloc extends Bloc<UserProfileEvent, UserProfileState> {
  final GetUserDataUseCase _getUserDataUseCase;

  UserProfileBloc({
    required GetUserDataUseCase getUserDataUseCase,
  }) : _getUserDataUseCase = getUserDataUseCase,
       super(const UserProfileState()) {
    on<_Initialize>(_initialize);
  }

  Future<void> _initialize(
    _Initialize event,
    Emitter<UserProfileState> emit,
  ) async {
    try {
      emit(
        state.copyWith(
          status: EUserProfileStatus.loading,
        ),
      );

      final userData = await _getUserDataUseCase(
        id: event.userId,
      );

      if (userData == null) {
        emit(
          state.copyWith(
            status: EUserProfileStatus.noData,
          ),
        );
      } else {
        emit(
          state.copyWith(
            userData: userData,
            status: EUserProfileStatus.loaded,
          ),
        );
      }
    } catch (e) {
      emit(
        state.copyWith(
          status: EUserProfileStatus.failed,
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
