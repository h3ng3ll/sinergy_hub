import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/models/user_match/matches.dart';
import '../../../domain/usecases/create_user_matches_use_case.dart';
import '../../../domain/usecases/listen_two_way_match_use_case.dart';
import '../tinder_card_cubit/tinder_card_cubit.dart';

part 'matches_event.dart';

part 'matches_state.dart';

part 'matches_bloc.freezed.dart';

class MatchesBloc extends Bloc<MatchesEvent, MatchesState> {
  final ListenTwoWayMatchUseCase _listenTwoWayMatchUseCase;
  final CreateUserMatchesUseCase _createUserMatchesUseCase;

  MatchesBloc({
    required ListenTwoWayMatchUseCase listenTwoWayMatchUseCase,
    required CreateUserMatchesUseCase createUserMatchesUseCase,
  }) : _listenTwoWayMatchUseCase = listenTwoWayMatchUseCase,
       _createUserMatchesUseCase = createUserMatchesUseCase,
       super(const MatchesState()) {
    on<_StartListening>(_startListening);
    on<_Create>(_create);
  }

  void _startListening(
    _StartListening event,
    Emitter<MatchesState> emit,
  ) async {
    await emit.forEach(
      _listenTwoWayMatchUseCase.call(),
      onData: (Matches? userMatch) {
        if (userMatch != null) {
          return state.copyWith(
            status: MatchesStatus.foundMatch,
            userMatch: userMatch,
          );
        }
        return state;
      },
      onError: (e, _) {
        return state.copyWith(
          status: MatchesStatus.failed,
          errorMessage: e.toString(),
        );
      },
    );
  }

  void _create(
    _Create event,
    Emitter<MatchesState> emit,
  ) async {
    final res = await _createUserMatchesUseCase.call(
      status: event.status,
      matchedID: event.matchedID,
    );
    res.fold(
      (_) {
        emit(
          state.copyWith(
            status: MatchesStatus.initial,
          ),
        );
      },
      (e) {
        emit(
          state.copyWith(
            status: MatchesStatus.failed,
            errorMessage: e.message,
          ),
        );
      },
    );
  }
}
