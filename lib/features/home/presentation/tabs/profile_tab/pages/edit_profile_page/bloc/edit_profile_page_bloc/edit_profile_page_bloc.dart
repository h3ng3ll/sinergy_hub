import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../../../onboard_survey/doman/models/skill/skill.dart';
import '../../../../../../../../user/domain/repositories/i_user_repository.dart';

part 'edit_profile_page_event.dart';

part 'edit_profile_page_state.dart';

part 'edit_profile_page_bloc.freezed.dart';

class EditProfilePageBloc
    extends Bloc<EditProfilePageEvent, EditProfilePageState> {
  final IUserRepository _userRepository;

  EditProfilePageBloc({
    required IUserRepository userRepository,
  }) : _userRepository = userRepository,
       super(const EditProfilePageState()) {
    on<_AddSkill>(_addSkill);
    on<_Initialize>(_initialize);
    on<_RemoveSkill>(_removeSkill);
    on<_ApplyChanges>(_applyChanges);
  }

  void _addSkill(event, emit) {
    try {
      final String skillName = event.name;
      final Skill skill = Skill(
        name: skillName,
      );
      emit(
        state.copyWith(
          skills: [
            ...state.skills,
            skill,
          ],
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          errorMessage: e.toString(),
          status: EditProfilePageStatus.failed,
        ),
      );
    }
  }

  void _removeSkill(event, emit) {
    try {
      emit(
        state.copyWith(
          status: EditProfilePageStatus.loading,
        ),
      );
      final Skill skill = event.skill;
      emit(
        state.copyWith(
          skills:
              List.from(
                state.skills,
              )..remove(
                skill,
              ),
          status: EditProfilePageStatus.initial,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          errorMessage: e.toString(),
          status: EditProfilePageStatus.failed,
        ),
      );
    }
  }

  Future<void> _initialize(
    event,
    Emitter<EditProfilePageState> emit,
  ) async {
    try {
      await emit.forEach(
        _userRepository.userDataStream(
          event.uid,
        ),
        onData: (userData) => state.copyWith(
          skills: userData?.profiler.skills ?? state.skills,
          status: EditProfilePageStatus.updated,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          errorMessage: e.toString(),
          status: EditProfilePageStatus.failed,
        ),
      );
    }
  }

  void _applyChanges(event, emit) {
    try {
      emit(
        state.copyWith(
          status: EditProfilePageStatus.loading,
        ),
      );
      final List<Skill> skills = event.skills;
      emit(
        state.copyWith(
          skills: skills,
          status: EditProfilePageStatus.initial,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          errorMessage: e.toString(),
          status: EditProfilePageStatus.failed,
        ),
      );
    }
  }
}
