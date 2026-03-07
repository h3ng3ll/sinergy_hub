import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../auth/domain/repostories/i_auth_repository.dart';
import '../../../../../onboard_survey/domain/models/specialization/specialization.dart';
import '../../../../domain/models/user_data/user_data.dart';
import '../../../../domain/usecases/get_current_user_data_use_case.dart';
import '../../../../domain/usecases/update_user_profiler_use_case.dart';

part 'edit_looking_for_event.dart';

part 'edit_looking_for_state.dart';

part 'edit_looking_for_bloc.freezed.dart';

class EditLookingForBloc
    extends Bloc<EditLookingForEvent, EditLookingForState> {
  final GetCurrentUserDataUseCase _getCurrentUserDataUseCase;
  final UpdateUserProfilerUseCase _updateUserProfilerUseCase;

  EditLookingForBloc({
    required GetCurrentUserDataUseCase getCurrentUserDataUseCase,
    required UpdateUserProfilerUseCase updateUserProfilerUseCase,
    required IAuthRepository authRepository,
  }) : _getCurrentUserDataUseCase = getCurrentUserDataUseCase,
       _updateUserProfilerUseCase = updateUserProfilerUseCase,
       super(const EditLookingForState()) {
    on<_Init>(_init);
    on<_ToggleSpecialization>(_toggleSpecialization);
    on<_Save>(_save);
  }

  Future<void> _init(
    _Init event,
    Emitter<EditLookingForState> emit,
  ) async {
    try {
      emit(
        state.copyWith(
          status: EditLookingForStatus.loading,
        ),
      );

      final userData = await _getCurrentUserDataUseCase();

      emit(
        state.copyWith(
          userData: userData,
          selectedSpecializations: userData.profiler.searchingSpecializations,
          status: EditLookingForStatus.loaded,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: EditLookingForStatus.failed,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  void _toggleSpecialization(
    _ToggleSpecialization event,
    Emitter<EditLookingForState> emit,
  ) {
    final selectedSpecializations = List<ESpecialization>.from(
      state.selectedSpecializations,
    );

    if (selectedSpecializations.contains(event.specialization)) {
      selectedSpecializations.remove(
        event.specialization,
      );
    } else {
      selectedSpecializations.add(
        event.specialization,
      );
    }

    emit(state.copyWith(selectedSpecializations: selectedSpecializations));
  }

  Future<void> _save(
    _Save event,
    Emitter<EditLookingForState> emit,
  ) async {
    try {
      if (state.userData == null) return;

      emit(state.copyWith(status: EditLookingForStatus.saving));

      final updatedProfiler = state.userData!.profiler.copyWith(
        searchingSpecializations: state.selectedSpecializations,
      );

      await _updateUserProfilerUseCase(updatedProfiler);

      emit(
        state.copyWith(
          status: EditLookingForStatus.saved,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: EditLookingForStatus.failed,
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
