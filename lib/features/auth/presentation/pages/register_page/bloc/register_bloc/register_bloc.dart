import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../domain/use_cases/register_use_case.dart';
import '../../../../../domain/use_cases/reload_use_case.dart';

part 'register_event.dart';

part 'register_state.dart';

part 'register_bloc.freezed.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final RegisterUseCase _registerUseCase;
  final ReloadUseCase _reloadUseCase;

  RegisterBloc({
    required RegisterUseCase registerUseCase,
    required ReloadUseCase reloadUseCase,
  }) : _registerUseCase = registerUseCase,
       _reloadUseCase = reloadUseCase,
       super(const RegisterState()) {
    on<_Register>(
      _register,
      transformer: droppable(),
    );
    on<_StartVerification>(
      _startVerification,
      transformer: droppable(),
    );
  }

  void _register(_Register event, emit) async {
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
            status: RegisterStatus.registered,
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

  void _startVerification(_StartVerification event, emit) async {
    emit(
      state.copyWith(
        status: RegisterStatus.loading,
      ),
    );
    final res = await _reloadUseCase.call();
    res.fold(
      (_) {
        emit(
          state.copyWith(
            status: RegisterStatus.reloaded,
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
}
