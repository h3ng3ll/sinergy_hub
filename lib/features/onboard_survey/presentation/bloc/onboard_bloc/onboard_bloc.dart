import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/models/onboard_status/onboard_status.dart';
import '../../../domain/use_cases/get_completion_status_use_case.dart';
import '../../../domain/use_cases/set_completion_status_use_case.dart';

part 'onboard_event.dart';

part 'onboard_state.dart';

part 'onboard_bloc.freezed.dart';

class OnboardBloc extends Bloc<OnboardEvent, OnboardState> {
  final GetCompletionStatusUseCase _getUserCompletionStatusUseCase;
  final SetCompletionStatusUseCase _setUserCompletionStatusUseCase;

  OnboardBloc({
    required GetCompletionStatusUseCase getUserCompletionStatusUseCase,
    required SetCompletionStatusUseCase setUserCompletionStatusUseCase,
  }) : _getUserCompletionStatusUseCase = getUserCompletionStatusUseCase,
       _setUserCompletionStatusUseCase = setUserCompletionStatusUseCase,
       super(
         OnboardState(
           onboardStatus: OnboardStatus(),
         ),
       ) {
    on<_Load>(_load);
    on<_Update>(_update);
  }

  void _update(_Update event, emit) async {
    try {
      emit(
        state.copyWith(
          status: EOnboardStatus.loading,
        ),
      );
      final onboardStatus = state.onboardStatus.copyWith(
        completeSpecialization:
            event.completeSpecialization ??
            state.onboardStatus.completeSpecialization,
        toldAboutYourself:
            event.toldAboutYourself ?? state.onboardStatus.toldAboutYourself,
      );
      await _setUserCompletionStatusUseCase.call(
        status: onboardStatus,
      );
      emit(
        state.copyWith(
          onboardStatus: onboardStatus,
          status: EOnboardStatus.initial,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: EOnboardStatus.failed,
          errorMessage: e.toString(),
        ),
      );
      rethrow;
    }
  }

  void _load(_Load event, emit) async {
    try {
      emit(
        state.copyWith(
          status: EOnboardStatus.loading,
        ),
      );
      final onboardStatus = await _getUserCompletionStatusUseCase.call();
      emit(
        state.copyWith(
          onboardStatus: onboardStatus ?? state.onboardStatus,
          status: EOnboardStatus.initial,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: EOnboardStatus.failed,
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
