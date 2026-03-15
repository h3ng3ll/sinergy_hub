import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../user/domain/models/user_data/user_data.dart';
import '../../../../user/domain/usecases/get_current_user_data_use_case.dart';
import '../../../domain/models/user_match/matches.dart';
import '../../../domain/usecases/find_match_chat_id_use_case.dart';
import '../../../domain/usecases/get_match_by_id_use_case.dart';
import '../../../domain/usecases/mark_as_notified_match_use_case.dart';

part 'match_result_event.dart';

part 'match_result_state.dart';

part 'match_result_bloc.freezed.dart';

class MatchResultBloc extends Bloc<MatchResultEvent, MatchResultState> {
  final GetMatchByIdUseCase _getMatchByIdUseCase;
  final GetCurrentUserDataUseCase _getCurrentUserDataUseCase;
  final MarkAsNotifiedMatchUseCase _markAsNotifiedMatchUseCase;
  final LookForMatchesUseCase _lookForMatchesUseCase;

  MatchResultBloc({
    required GetMatchByIdUseCase getMatchByIdUseCase,
    required GetCurrentUserDataUseCase getCurrentUserDataUseCase,
    required MarkAsNotifiedMatchUseCase markAsNotifiedMatchUseCase,
    required LookForMatchesUseCase lookForMatchesUseCase,
  }) : _getMatchByIdUseCase = getMatchByIdUseCase,
       _markAsNotifiedMatchUseCase = markAsNotifiedMatchUseCase,
       _getCurrentUserDataUseCase = getCurrentUserDataUseCase,
       _lookForMatchesUseCase = lookForMatchesUseCase,
       super(const MatchResultState()) {
    on<_GetResult>(_getResult);
  }

  void _getResult(
    _GetResult event,
    Emitter<MatchResultState> emit,
  ) async {
    try {
      emit(
        state.copyWith(
          status: MatchResultStatus.loading,
        ),
      );
      final match = await _getMatchByIdUseCase.call(
        matchId: event.matchId,
      );
      final user = await _getCurrentUserDataUseCase.call();

      final chatId = await _lookForMatchesUseCase.call(
        matchId: event.matchId,
      );

      await _markAsNotifiedMatchUseCase.call(
        match.matchId,
      );
      emit(
        state.copyWith(
          status: MatchResultStatus.loaded,
          user: user,
          match: match,

          chatId: chatId,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: MatchResultStatus.failed,
          errorMessage: e.toString(),
        ),
      );
      rethrow;
    }
  }
}
