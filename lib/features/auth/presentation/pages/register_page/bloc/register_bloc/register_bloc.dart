import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../domain/failures/email_not_verified_failure.dart';
import '../../../../../domain/use_cases/complete_registration_use_case.dart';
import '../../../../../domain/use_cases/register_use_case.dart';

part 'register_event.dart';

part 'register_state.dart';

part 'register_bloc.freezed.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final RegisterUseCase _registerUseCase;
  final CompleteRegistrationUseCase _completeRegistrationUseCase;

  RegisterBloc({
    required RegisterUseCase registerUseCase,
    required CompleteRegistrationUseCase completeRegistrationUseCase,
  }) : _registerUseCase = registerUseCase,
       _completeRegistrationUseCase = completeRegistrationUseCase,
       super(const RegisterState()) {
    on<_Register>(
      _register,
      transformer: droppable(),
    );
    on<_CheckVerification>(
      _checkVerification,
      transformer: droppable(),
    );
  }

  void _register(_Register event, Emitter<RegisterState> emit) async {
    emit(
      state.copyWith(
        status: RegisterStatus.loading,
      ),
    );
    final res = await _registerUseCase.call(
      email: event.email,
      password: event.password,
    );
    res.fold(
      (_) {
        emit(
          state.copyWith(
            status: RegisterStatus.pendingVerification,
          ),
        );
      },
      (e) {
        emit(
          state.copyWith(
            status: RegisterStatus.failed,
            errorMessage: e.message,
          ),
        );
      },
    );
  }

  void _checkVerification(
    _CheckVerification event,
    Emitter<RegisterState> emit,
  ) async {
    final res = await _completeRegistrationUseCase.call();
    res.fold(
      (_) {
        emit(
          state.copyWith(
            status: RegisterStatus.registered,
          ),
        );
      },
      (e) {
        if (e is EmailNotVerifiedFailure) {
          /// Expected during polling — stay in pendingVerification.
          return;
        }
        emit(
          state.copyWith(
            status: RegisterStatus.failed,
            errorMessage: e.message,
          ),
        );
      },
    );
  }
}
