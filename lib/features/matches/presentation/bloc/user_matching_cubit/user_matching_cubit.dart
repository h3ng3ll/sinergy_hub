import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../user/presentation/bloc/user_cubit/user_cubit.dart';
import '../../../domain/models/user_match/user_match.dart';
import '../../../domain/repositories/i_user_matching_out_repository.dart';
import '../../../domain/usecases/create_user_matches_use_case.dart';
import '../../../domain/usecases/get_user_matches_use_case.dart';

part 'user_matching_state.dart';

part 'user_matching_cubit.freezed.dart';

class UserMatchingCubit extends Cubit<UserMatchingState> {
  final CreateUserMatchesUseCase _createUserMatchesUseCase;
  final GetUserMatchesUseCase _getUserMatchesUseCase;
  final UserCubit _userCubit;
  late final StreamSubscription _matchesSubscription;

  UserMatchingCubit({
    required UserCubit userCubit,
    required GetUserMatchesUseCase getUserMatchesUseCase,
    required CreateUserMatchesUseCase createUserMatchesUseCase,
  }) : _userCubit = userCubit,
       _getUserMatchesUseCase = getUserMatchesUseCase,
       _createUserMatchesUseCase = createUserMatchesUseCase,
       super(const UserMatchingState()) {
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
          status: UserMatchingStatus.loading,
        ),
      );

      final status = await _createUserMatchesUseCase.call(
        uid: uid,
        match: match,
      );
      if(status == EUserMatchCompleteness.twoWayMatch){
        emit(
          state.copyWith(
            status: UserMatchingStatus.foundMatch,
          ),
        );
      }else {
        emit(
          state.copyWith(
            status: UserMatchingStatus.initial,
          ),
        );
      }
    } catch (e) {
      emit(
        state.copyWith(
          errorMessage: e.toString(),
          status: UserMatchingStatus.failed,
        ),
      );
    }
  }

  void resetFoundMatch () {
    emit(
      state.copyWith(
        status: UserMatchingStatus.initial,
      ),
    );
  }
  @override
  Future<void> close() {
    _matchesSubscription.cancel();
    return super.close();
  }
}
