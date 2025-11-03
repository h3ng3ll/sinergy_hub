import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../../../onboard_survey/doman/models/skill/skill.dart';
import '../../../../../../../../user/presentation/bloc/user_cubit/user_cubit.dart';

part 'edit_profile_page_event.dart';

part 'edit_profile_page_state.dart';

part 'edit_profile_page_bloc.freezed.dart';

class EditProfilePageBloc
    extends Bloc<EditProfilePageEvent, EditProfilePageState> {
  final UserCubit _userCubit;
  StreamSubscription? _userSubscription;

  EditProfilePageBloc({
    required UserCubit userCubit,
  }) : _userCubit = userCubit,
       super(const EditProfilePageState()) {
    on<_AddSkill>(_addSkill);
    on<_Initialize>(_initialize);
    on<_RemoveSkill>(_removeSkill);
    on<_ApplyChanges>(_applyChanges);

    // _userSubscription = _userCubit.stream.listen((userState) {
    //   if (userState.userData?.profiler.skills != state.skills) {
    //     add(
    //       EditProfilePageEvent.initialize(
    //         skills: userState.userData?.profiler.skills ?? [],
    //       ),
    //     );
    //   }
    // });
    add(
      EditProfilePageEvent.initialize(
        skills: _userCubit.state.userData?.profiler.skills ?? [],
      ),
    );
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

  void _initialize(event, emit) {
    try {
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

  @override
  Future<void> close() {
    _userSubscription?.cancel();
    return super.close();
  }
}
