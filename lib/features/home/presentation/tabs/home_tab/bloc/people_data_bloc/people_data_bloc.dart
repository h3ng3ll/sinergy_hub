import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../matches/presentation/bloc/user_matches_outcome_cubit/user_matches_outcome_cubit.dart';
import '../../../../../../user/domain/models/users_data_pg_state/users_data_pg_state.dart';
import '../../../../../../user/presentation/bloc/user_cubit/user_cubit.dart';
import '../../../../../domain/enums/e_people_data_status.dart';
import '../../../../../../user/domain/models/user_data/user_data.dart';
import '../../../../../domain/use_cases/look_for_matches_use_case.dart';

part 'people_data_event.dart';

part 'people_data_state.dart';

part 'people_data_bloc.freezed.dart';

class PeopleDataBloc extends Bloc<PeopleDataEvent, PeopleDataState> {
  final LookForMatchesUseCase _lookForMatchesUseCase;
  final UserCubit _userCubit;
  StreamSubscription? _subscription;

  PeopleDataBloc({
    required UserMatchesOutcomeCubit userMatchesOutcomeCubit,
    required LookForMatchesUseCase lookForMatchesUseCase,
    required UserCubit userCubit,
  }) : _lookForMatchesUseCase = lookForMatchesUseCase,
       _userCubit = userCubit,
       super(const PeopleDataState()) {
    on<_LoadPeoples>(_loadPeoples);
    on<_RemoveVisible>(_removeVisible);
    on<_UpdateViewedPeoples>(_updateViewedPeoples);

    _subscription = userMatchesOutcomeCubit.stream.listen(
      (e) {
        add(
          PeopleDataEvent.updateViewedPeoples(
            uids: e.userMatches
                .map(
                  (e) => e.user.uid,
                )
                .toList(),
          ),
        );
      },
    );
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
      /// fetch users and exclude already matched people if it
      /// found include current user
      final List<UserData> users = await _lookForMatchesUseCase.call(
        userDataState: UserDataPgState(
          excludedUids: {
            _userCubit.uid!,
            ...state.viewedUids,
          },
        ),
      );
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

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
