import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../onboard_survey/domain/use_cases/get_skills_use_case.dart';

part 'skills_event.dart';

part 'skills_state.dart';

part 'skills_bloc.freezed.dart';

class SkillsBloc extends Bloc<SkillsEvent, SkillsState> {
  final GetSkillsUseCase _getSkillsUseCase;

  SkillsBloc({
    required GetSkillsUseCase getSkillsUseCase,
  }) : _getSkillsUseCase = getSkillsUseCase,
       super(const SkillsState()) {
    on<_Fetch>(_fetch);
  }

  Future<void> _fetch(
    _Fetch event,
    Emitter<SkillsState> emit,
  ) async {
    try {
      emit(
        state.copyWith(
          status: SkillsStatus.loading,
        ),
      );

      final skills = await _getSkillsUseCase.call();

      emit(
        state.copyWith(
          skills: skills,
          status: SkillsStatus.loaded,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: SkillsStatus.failed,
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
