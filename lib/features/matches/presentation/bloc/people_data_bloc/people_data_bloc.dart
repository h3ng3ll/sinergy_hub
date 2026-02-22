import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/models/e_people_data_status.dart';
import '../../../../user/domain/models/user_data/user_data.dart';
import '../../../domain/usecases/look_for_matches_use_case.dart';

part 'people_data_event.dart';

part 'people_data_state.dart';

part 'people_data_bloc.freezed.dart';

class PeopleDataBloc extends Bloc<PeopleDataEvent, PeopleDataState> {
  final LookForMatchesUseCase _lookForMatchesUseCase;

  PeopleDataBloc({
    required LookForMatchesUseCase lookForMatchesUseCase,
  }) : _lookForMatchesUseCase = lookForMatchesUseCase,
       super(const PeopleDataState()) {
    on<_LoadPeoples>(_loadPeoples);
    on<_RemoveVisible>(_removeVisible);
    on<_UpdateViewedPeoples>(_updateViewedPeoples);
  }

  Future<void> _updateViewedPeoples(event, emit) async {
    final uids = event.uids;
    emit(
      state.copyWith(
        viewedUids: uids,
        status: EPeopleDataStatus.initial,
      ),
    );
    if (!state.initialized) {
      add(
        PeopleDataEvent.loadPeoples(),
      );
    }
  }

  Future<void> _loadPeoples(event, emit) async {
    try {
      emit(
        state.copyWith(
          status: EPeopleDataStatus.loading,
        ),
      );
      final List<UserData> users = await _lookForMatchesUseCase.call();
      emit(
        state.copyWith(
          initialized: true,
          status: EPeopleDataStatus.initial,
          users: users,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          initialized: true,
          status: EPeopleDataStatus.failed,
          errorMessage: e.toString(),
        ),
      );
      rethrow;
    }
  }

  Future<void> _removeVisible(event, emit) async {
    try {
      emit(
        state.copyWith(
          status: EPeopleDataStatus.loading,
        ),
      );

      emit(
        state.copyWith(
          status: EPeopleDataStatus.initial,
          users: List.from(
            state.users,
          )..removeLast(),
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: EPeopleDataStatus.failed,
          errorMessage: e.toString(),
        ),
      );
      rethrow;
    }
  }
}
