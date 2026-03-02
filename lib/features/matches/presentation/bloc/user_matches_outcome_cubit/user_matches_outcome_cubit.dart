import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/models/user_match/user_match.dart';
import '../../../domain/usecases/create_user_matches_use_case.dart';
import '../../../domain/usecases/get_user_matches_outcome_use_case.dart';

part 'user_matches_outcome_state.dart';

part 'user_matches_outcome_cubit.freezed.dart';

class UserMatchesOutcomeCubit extends Cubit<UserMatchesOutcomeState> {
  final CreateUserMatchesUseCase _createUserMatchesUseCase;
  final GetUserMatchesOutcomeUseCase _getUserMatchesUseCase;
  late final StreamSubscription? _matchesSubscription;

  UserMatchesOutcomeCubit({
    required GetUserMatchesOutcomeUseCase getUserMatchesOutcomeUseCase,
    required CreateUserMatchesUseCase createUserMatchesUseCase,
  }) : _getUserMatchesUseCase = getUserMatchesOutcomeUseCase,
       _createUserMatchesUseCase = createUserMatchesUseCase,
       super(const UserMatchesOutcomeState()) ;

  void init(List<UserMatch> matches) {
    _matchesSubscription = _getUserMatchesUseCase.call().listen(
      (e) {
        emit(
          state.copyWith(
            userMatches: matches,
          ),
        );
      },
    );
  }

  Future<void> create({
    required UserMatch match,
  }) async {
    try {
      emit(
        state.copyWith(
          status: UserMatchesOutcomeStatus.loading,
        ),
      );
      final status = await _createUserMatchesUseCase.call(
        match: match,
      );
      if (status == EUserMatchCompleteness.twoWayMatch) {
        emit(
          state.copyWith(
            status: UserMatchesOutcomeStatus.foundMatch,
          ),
        );
      } else {
        emit(
          state.copyWith(
            status: UserMatchesOutcomeStatus.initial,
          ),
        );
      }
    } catch (e) {
      emit(
        state.copyWith(
          errorMessage: e.toString(),
          status: UserMatchesOutcomeStatus.failed,
        ),
      );
    }
  }

  void resetFoundMatch() {
    emit(
      state.copyWith(
        status: UserMatchesOutcomeStatus.initial,
      ),
    );
  }

  @override
  Future<void> close() {
    _matchesSubscription?.cancel();
    return super.close();
  }
}
