import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../onboard_survey/domain/models/experience/experience.dart';
import '../../../../domain/models/user_data/user_data.dart';
import '../../../../domain/usecases/get_current_user_data_use_case.dart';
import '../../../../domain/usecases/update_user_profiler_use_case.dart';

part 'edit_experience_event.dart';

part 'edit_experience_state.dart';

part 'edit_experience_state_ext.dart';

part 'edit_experience_bloc.freezed.dart';

class EditExperienceBloc
    extends Bloc<EditExperienceEvent, EditExperienceState> {
  final GetCurrentUserDataUseCase _getCurrentUserDataUseCase;
  final UpdateUserProfilerUseCase _updateUserProfilerUseCase;

  EditExperienceBloc({
    required GetCurrentUserDataUseCase getCurrentUserDataUseCase,
    required UpdateUserProfilerUseCase updateUserProfilerUseCase,
  }) : _getCurrentUserDataUseCase = getCurrentUserDataUseCase,
       _updateUserProfilerUseCase = updateUserProfilerUseCase,
       super(const EditExperienceState()) {
    on<_Init>(_init);
    on<_Select>(_select);
    on<_Save>(_save);
  }

  Future<void> _init(
    _Init event,
    Emitter<EditExperienceState> emit,
  ) async {
    try {
      emit(
        state.copyWith(
          status: EEditExperienceStatus.loading,
        ),
      );

      final userData = await _getCurrentUserDataUseCase();

      emit(
        state.copyWith(
          userData: userData,
          selectedExperience: userData.profiler.experience,
          status: EEditExperienceStatus.loaded,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: EEditExperienceStatus.failed,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  void _select(
    _Select event,
    Emitter<EditExperienceState> emit,
  ) {
    emit(state.copyWith(selectedExperience: event.experience));
  }

  Future<void> _save(
    _Save event,
    Emitter<EditExperienceState> emit,
  ) async {
    final userData = state.userData;
    final selectedExperience = state.selectedExperience;
    if (userData == null || selectedExperience == null) return;

    try {
      emit(state.copyWith(status: EEditExperienceStatus.saving));

      final updatedProfiler = userData.profiler.copyWith(
        experience: selectedExperience,
      );

      await _updateUserProfilerUseCase(updatedProfiler);

      emit(
        state.copyWith(
          status: EEditExperienceStatus.saved,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: EEditExperienceStatus.failed,
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
