import 'dart:async';
import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../onboard_survey/domain/models/skill/skill.dart';
import '../../../../../user/domain/models/user_data/user_data.dart';
import '../../../../../user/domain/usecases/listen_current_user_data_use_case.dart';
import '../../../../../user/domain/usecases/update_user_usecase.dart';

part 'edit_profile_page_event.dart';

part 'edit_profile_page_state.dart';

part 'edit_profile_page_bloc.freezed.dart';

class EditProfilePageBloc
    extends Bloc<EditProfilePageEvent, EditProfilePageState> {
  final ListenCurrentUserDataUseCase _listenCurrentUserDataUseCase;
  final UpdateUserUseCase _updateUserUseCase;

  EditProfilePageBloc({
    required ListenCurrentUserDataUseCase listenCurrentUserDataUseCase,
    required UpdateUserUseCase updateUserUseCase,
  }) : _listenCurrentUserDataUseCase = listenCurrentUserDataUseCase,
       _updateUserUseCase = updateUserUseCase,
       super(const EditProfilePageState()) {
    on<_AddSkill>(_addSkill);
    on<_Initialize>(_initialize);
    on<_RemoveSkill>(_removeSkill);
    on<_ApplyChanges>(
      _applyChanges,
      transformer: droppable(),
    );
  }

  void _addSkill(_AddSkill event, emit) {
    final String skillName = event.name;
    final Skill skill = Skill(
      name: skillName,
    );

    final List<Skill> skills = {
      ...state.skills,
      skill,
    }.toList();

    if (skills.length > 30) {
      emit(
        state.copyWith(
          errorMessage: 'Exceeded skills limits',
          status: EditProfilePageStatus.failed,
        ),
      );
      return;
    }
    emit(
      state.copyWith(
        skills: skills,
      ),
    );
  }

  void _removeSkill(_RemoveSkill event, emit) {
    final Skill skill = event.skill;

    emit(
      state.copyWith(
        skills: List.from(state.skills)..remove(skill),
      ),
    );
  }

  Future<void> _initialize(
    _Initialize event,
    Emitter<EditProfilePageState> emit,
  ) async {
    try {
      emit(
        state.copyWith(status: EditProfilePageStatus.loading),
      );
      await emit.forEach(
        _listenCurrentUserDataUseCase.call(),
        onData:
            (
              userData,
            ) => state.copyWith(
              userData: userData,
              skills: userData?.profiler.skills ?? state.skills,
            ),
        onError: (e, _) => state.copyWith(
          errorMessage: e.toString(),
          status: EditProfilePageStatus.failed,
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

  Future<void> _applyChanges(
    _ApplyChanges event,
    Emitter<EditProfilePageState> emit,
  ) async {
    try {
      emit(
        state.copyWith(
          status: EditProfilePageStatus.updating,
        ),
      );

      final userData = state.userData;
      if (userData == null) {
        emit(
          state.copyWith(
            errorMessage: 'User data not loaded',
            status: EditProfilePageStatus.failed,
          ),
        );
        return;
      }

      final result = await _updateUserUseCase.call(
        userData.copyWith(
          firstName: event.firstName,
          lastName: event.lastName,
          aboutMe: event.aboutMe,
          profiler: userData.profiler.copyWith(
            skills: state.skills,
          ),
        ),
        event.img,
      );

      result.fold(
        (_) {
          emit(
            state.copyWith(
              status: EditProfilePageStatus.updated,
            ),
          );
        },
        (failure) {
          emit(
            state.copyWith(
              errorMessage: failure.message,
              status: EditProfilePageStatus.failed,
            ),
          );
        },
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
