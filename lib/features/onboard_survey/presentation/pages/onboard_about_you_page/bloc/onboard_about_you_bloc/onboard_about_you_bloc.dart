import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../domain/use_cases/get_cached_auth_credentials_use_case.dart';

part 'onboard_about_you_event.dart';

part 'onboard_about_you_state.dart';

part 'onboard_about_you_state_ext.dart';

part 'onboard_about_you_bloc.freezed.dart';

/// Holds the "Tell about yourself" page state. On [OnboardAboutYouEvent.load]
/// it reads the credentials cached during Apple authorization and exposes the
/// primary first/last name (and email) so the page can seed its controllers.
class OnboardAboutYouBloc
    extends Bloc<OnboardAboutYouEvent, OnboardAboutYouState> {
  final GetCachedAuthCredentialsUseCase _getCachedAuthCredentialsUseCase;

  OnboardAboutYouBloc({
    required GetCachedAuthCredentialsUseCase getCachedAuthCredentialsUseCase,
  }) : _getCachedAuthCredentialsUseCase = getCachedAuthCredentialsUseCase,
       super(const OnboardAboutYouState()) {
    on<_Load>(_load);
  }

  void _load(
    _Load event,
    Emitter<OnboardAboutYouState> emit,
  ) {
    try {
      emit(
        state.copyWith(
          status: EOnboardAboutYouStatus.loading,
        ),
      );

      final cached = _getCachedAuthCredentialsUseCase();

      emit(
        state.copyWith(
          status: EOnboardAboutYouStatus.ready,
          firstName: cached?.firstName ?? '',
          lastName: cached?.lastName ?? '',
          email: cached?.email,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: EOnboardAboutYouStatus.failed,
          errorMessage: e.toString(),
        ),
      );
      rethrow;
    }
  }
}
