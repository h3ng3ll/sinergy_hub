import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../matches/presentation/bloc/user_matching_cubit/user_matching_cubit.dart';
import '../../../../../../user/domain/models/users_data_pg_state/users_data_pg_state.dart';
import '../../../../../domain/enums/e_people_data_status.dart';
import '../../../../../../user/domain/models/user_data/user_data.dart';
import '../../../../../domain/use_cases/look_for_matches_use_case.dart';

part 'people_data_event.dart';

part 'people_data_state.dart';

part 'people_data_bloc.freezed.dart';

class PeopleDataBloc extends Bloc<PeopleDataEvent, PeopleDataState> {
  final LookForMatchesUseCase _lookForMatchesUseCase;

  StreamSubscription? _subscription;

  PeopleDataBloc({
    required UserMatchingCubit userMatchingCubit,
    required LookForMatchesUseCase lookForMatchesUseCase,
  }) : _lookForMatchesUseCase = lookForMatchesUseCase,
       super(const PeopleDataState()) {
    on<_LoadPeoples>(_loadPeoples);
    on<_RemoveVisible>(_removeVisible);
    on<_UpdateViewedPeoples>(_updateViewedPeoples);

    _subscription = userMatchingCubit.stream.listen(
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
      ),
    );
  }

  Future<void> _loadPeoples(event, emit) async {
    try {
      emit(
        state.copyWith(
          status: EPeopleDataStatus.loading,
        ),
      );
      final List<UserData> users = await _lookForMatchesUseCase.call(
        userDataState: UserDataPgState(),
      );
      emit(
        state.copyWith(
          status: EPeopleDataStatus.initial,
          users: users,
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
