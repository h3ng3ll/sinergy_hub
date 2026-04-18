import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../domain/use_cases/reset_password_by_email_use_case.dart';

part 'reset_password_page_event.dart';

part 'reset_password_page_state.dart';

part 'reset_password_page_bloc.freezed.dart';

class ResetPasswordPageBloc
    extends Bloc<ResetPasswordPageEvent, ResetPasswordPageState> {
  final ResetPasswordByEmailUseCase _resetPasswordByEmailUseCase;

  ResetPasswordPageBloc({
    required ResetPasswordByEmailUseCase resetPasswordByEmailUseCase,
  }) : _resetPasswordByEmailUseCase = resetPasswordByEmailUseCase,
       super(const ResetPasswordPageState()) {
    on<_Reset>(_reset);
  }

  void _reset(
    _Reset event,
    Emitter<ResetPasswordPageState> emit,
  ) async {
    final email = event.email;
    emit(
      state.copyWith(
        status: ResetPasswordPageStatus.loading,
      ),
    );
    final res = await _resetPasswordByEmailUseCase.call(
      email,
    );
    res.fold(
      (_) {
        emit(
          state.copyWith(
            status: ResetPasswordPageStatus.emailSent,
          ),
        );
      },
      (e) {
        emit(
          state.copyWith(
            status: ResetPasswordPageStatus.failed,
            errorMessage: e.message,
          ),
        );
      },
    );
  }
}
