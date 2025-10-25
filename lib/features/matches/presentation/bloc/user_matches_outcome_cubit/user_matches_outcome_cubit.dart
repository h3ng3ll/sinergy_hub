import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../user/presentation/bloc/user_cubit/user_cubit.dart';
import '../../../domain/models/user_match/user_match.dart';
import '../../../domain/usecases/create_user_matches_use_case.dart';
import '../../../domain/usecases/get_user_matches_outcome_use_case.dart';

part 'user_matches_outcome_state.dart';
part 'user_matches_outcome_cubit.freezed.dart';

class UserMatchesOutcomeCubit extends Cubit<UserMatchesOutcomeState> {
  final CreateUserMatchesUseCase _createUserMatchesUseCase;
  final GetUserMatchesOutcomeUseCase _getUserMatchesUseCase;
  final UserCubit _userCubit;
  late final StreamSubscription _matchesSubscription;

  UserMatchesOutcomeCubit({
    required UserCubit userCubit,
    required GetUserMatchesOutcomeUseCase getUserMatchesOutcomeUseCase,
    required CreateUserMatchesUseCase createUserMatchesUseCase,
  }) : _userCubit = userCubit,
        _getUserMatchesUseCase = getUserMatchesOutcomeUseCase,
        _createUserMatchesUseCase = createUserMatchesUseCase,
        super(const UserMatchesOutcomeState()) {
    final uid = _userCubit.uid;
    if (uid == null) return;

    _matchesSubscription = _getUserMatchesUseCase
        .call(
      uid,
    )
        .listen(
      _update,
    );
  }

  void _update(List<UserMatch> matches) => emit(
    state.copyWith(
      userMatches: matches,
    ),
  );

  Future<void> create({
    required UserMatch match,
  }) async {
    try {
      final uid = _userCubit.uid;
      if (uid == null) return;
      emit(
        state.copyWith(
          status: UserMatchesOutcomeStatus.loading,
        ),
      );

      final status = await _createUserMatchesUseCase.call(
        uid: uid,
        match: match,
      );
      if(status == EUserMatchCompleteness.twoWayMatch){
        emit(
          state.copyWith(
            status: UserMatchesOutcomeStatus.foundMatch,
          ),
        );
      }else {
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

  void resetFoundMatch () {
    emit(
      state.copyWith(
        status: UserMatchesOutcomeStatus.initial,
      ),
    );
  }
  @override
  Future<void> close() {
    _matchesSubscription.cancel();
    return super.close();
  }}
