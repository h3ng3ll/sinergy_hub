import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../domain/use_cases/login_use_case.dart';
import '../../../../../domain/use_cases/reload_use_case.dart';

part 'login_event.dart';

part 'login_state.dart';

part 'login_bloc.freezed.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase _loginUseCase;
  final ReloadUseCase _reloadUseCase;

  LoginBloc({
    required LoginUseCase loginUseCase,
    required ReloadUseCase reloadUseCase,
  }) : _loginUseCase = loginUseCase,
       _reloadUseCase = reloadUseCase,
       super(const LoginState()) {
    on<_Login>(_login);
    on<_Refresh>(_refresh);
  }

  void _login(
    _Login event,
    Emitter<LoginState> emit,
  ) async {
    emit(
      state.copyWith(
        status: LoginStatus.loading,
      ),
    );
    final res = await _loginUseCase.call(
      email: event.email,
      password: event.password,
    );
    res.fold(
      (_) {
        emit(
          state.copyWith(
            status: LoginStatus.authorized,
          ),
        );
      },
      (e) {
        emit(
          state.copyWith(
            status: LoginStatus.failed,
            errorMessage: e.message,
          ),
        );
      },
    );
  }

  void _refresh(
    _Refresh event,
    Emitter<LoginState> emit,
  ) async {
    emit(
      state.copyWith(
        status: LoginStatus.loading,
      ),
    );
    final res = await _reloadUseCase.call();
    res.fold(
      (_) {
        emit(
          state.copyWith(
            status: LoginStatus.authorized,
          ),
        );
      },
      (e) {
        emit(
          state.copyWith(
            status: LoginStatus.failed,
            errorMessage: e.message,
          ),
        );
      },
    );
  }
}
