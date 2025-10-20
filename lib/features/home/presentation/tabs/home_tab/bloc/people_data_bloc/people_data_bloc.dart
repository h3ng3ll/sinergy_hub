import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../domain/models/user_data/user_data.dart';
import '../../../../../domain/repositories/i_user_data_repository.dart';

part 'people_data_event.dart';

part 'people_data_state.dart';

part 'people_data_bloc.freezed.dart';

class PeopleDataBloc extends Bloc<PeopleDataEvent, PeopleDataState> {
  final IUserDataRepository _userDataRepository;

  PeopleDataBloc({
    required IUserDataRepository userRepository,
  }) : _userDataRepository = userRepository,
       super(const PeopleDataState()) {
    on<_LoadPeoples>(_loadPeoples);
    on<_RemoveVisible>(_removeVisible);
  }

  Future<void> _loadPeoples(event, emit) async {
    try {
      emit(
        state.copyWith(
          status: PeopleDataStatus.loading,
        ),
      );
      final List<UserData> users = await _userDataRepository.get();
      emit(
        state.copyWith(
          status: PeopleDataStatus.initial,
          users: users,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: PeopleDataStatus.failed,
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
          status: PeopleDataStatus.loading,
        ),
      );

      emit(
        state.copyWith(
          status: PeopleDataStatus.initial,
          users: List.from(
            state.users,
          )..removeLast(),
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: PeopleDataStatus.failed,
          errorMessage: e.toString(),
        ),
      );
      rethrow;
    }
  }
}
