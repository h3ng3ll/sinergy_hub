import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../domain/use_cases/register_use_case.dart';

part 'register_event.dart';

part 'register_state.dart';

part 'register_bloc.freezed.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final RegisterUseCase _registerUseCase;

  RegisterBloc({
    required RegisterUseCase registerUseCase,
  }) : _registerUseCase = registerUseCase,
       super(const RegisterState()) {
    on<_Register>(_register);
  }

  void _register(_Register event, emit) async {
    try {
      emit(
        state.copyWith(
          status: RegisterStatus.loading,
        ),
      );
      await _registerUseCase.call(
        email: event.email,
        password: event.password,
      );

      emit(
        state.copyWith(
          status: RegisterStatus.authorized,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: RegisterStatus.failed,
          errorMessage: e.toString(),
        ),
      );
      rethrow;
    }
  }
}
