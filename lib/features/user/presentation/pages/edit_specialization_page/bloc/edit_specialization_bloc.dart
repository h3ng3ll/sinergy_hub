import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../onboard_survey/domain/models/specialization/specialization.dart';
import '../../../../domain/models/user_data/user_data.dart';
import '../../../../domain/usecases/get_current_user_data_use_case.dart';
import '../../../../domain/usecases/update_user_profiler_use_case.dart';

part 'edit_specialization_event.dart';

part 'edit_specialization_state.dart';

part 'edit_specialization_state_ext.dart';

part 'edit_specialization_bloc.freezed.dart';

class EditSpecializationBloc
    extends Bloc<EditSpecializationEvent, EditSpecializationState> {
  final GetCurrentUserDataUseCase _getCurrentUserDataUseCase;
  final UpdateUserProfilerUseCase _updateUserProfilerUseCase;

  EditSpecializationBloc({
    required GetCurrentUserDataUseCase getCurrentUserDataUseCase,
    required UpdateUserProfilerUseCase updateUserProfilerUseCase,
  }) : _getCurrentUserDataUseCase = getCurrentUserDataUseCase,
       _updateUserProfilerUseCase = updateUserProfilerUseCase,
       super(const EditSpecializationState()) {
    on<_Init>(_init);
    on<_Select>(_select);
    on<_Save>(_save);
  }

  Future<void> _init(
    _Init event,
    Emitter<EditSpecializationState> emit,
  ) async {
    try {
      emit(
        state.copyWith(
          status: EEditSpecializationStatus.loading,
        ),
      );

      final userData = await _getCurrentUserDataUseCase();

      emit(
        state.copyWith(
          userData: userData,
          selectedSpecialization: userData.profiler.specialization,
          status: EEditSpecializationStatus.loaded,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: EEditSpecializationStatus.failed,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  void _select(
    _Select event,
    Emitter<EditSpecializationState> emit,
  ) {
    emit(state.copyWith(selectedSpecialization: event.specialization));
  }

  Future<void> _save(
    _Save event,
    Emitter<EditSpecializationState> emit,
  ) async {
    final userData = state.userData;
    final selectedSpecialization = state.selectedSpecialization;
    if (userData == null || selectedSpecialization == null) return;

    try {
      emit(state.copyWith(status: EEditSpecializationStatus.saving));

      final updatedProfiler = userData.profiler.copyWith(
        specialization: selectedSpecialization,
      );

      await _updateUserProfilerUseCase(updatedProfiler);

      emit(
        state.copyWith(
          status: EEditSpecializationStatus.saved,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: EEditSpecializationStatus.failed,
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
