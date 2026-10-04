import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../domain/failures/email_not_verified_failure.dart';
import '../../../../../domain/use_cases/complete_registration_use_case.dart';
import '../../../../../domain/use_cases/login_use_case.dart';
import '../../../../../domain/use_cases/send_email_verification_use_case.dart';

part 'login_event.dart';

part 'login_state.dart';

part 'login_bloc.freezed.dart';

/// Seconds the Resend button stays disabled after a verification email.
const int _kResendCountdownSeconds = 60;

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase _loginUseCase;
  final CompleteRegistrationUseCase _completeRegistrationUseCase;
  final SendEmailVerificationUseCase _sendEmailVerificationUseCase;

  Timer? _countdownTimer;

  LoginBloc({
    required LoginUseCase loginUseCase,
    required CompleteRegistrationUseCase completeRegistrationUseCase,
    required SendEmailVerificationUseCase sendEmailVerificationUseCase,
  }) : _loginUseCase = loginUseCase,
       _completeRegistrationUseCase = completeRegistrationUseCase,
       _sendEmailVerificationUseCase = sendEmailVerificationUseCase,
       super(const LoginState()) {
    on<_Login>(
      _login,
      transformer: droppable(),
    );
    on<_CheckVerification>(
      _checkVerification,
      transformer: droppable(),
    );
    on<_ResendVerification>(
      _resendVerification,
      transformer: droppable(),
    );
    on<_TickCountdown>(_tickCountdown);
  }

  Future<void> _login(
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
        if (e is EmailNotVerifiedFailure) {
          emit(
            state.copyWith(
              status: LoginStatus.pendingVerification,
              resendCountdown: _kResendCountdownSeconds,
            ),
          );
          _startCountdown();
          return;
        }
        emit(
          state.copyWith(
            status: LoginStatus.failed,
            errorMessage: e.message,
          ),
        );
      },
    );
  }

  Future<void> _checkVerification(
    _CheckVerification event,
    Emitter<LoginState> emit,
  ) async {
    final res = await _completeRegistrationUseCase.call();
    res.fold(
      (_) {
        _countdownTimer?.cancel();
        emit(
          state.copyWith(
            status: LoginStatus.authorized,
          ),
        );
      },
      (e) {
        /// Expected while polling — stay in pendingVerification.
        if (e is EmailNotVerifiedFailure) return;
        emit(
          state.copyWith(
            status: LoginStatus.failed,
            errorMessage: e.message,
          ),
        );
      },
    );
  }

  Future<void> _resendVerification(
    _ResendVerification event,
    Emitter<LoginState> emit,
  ) async {
    if (state.isCounting) return;
    final res = await _sendEmailVerificationUseCase.call();
    res.fold(
      (_) {
        emit(
          state.copyWith(
            resendCountdown: _kResendCountdownSeconds,
          ),
        );
        _startCountdown();
      },
      (e) {
        emit(
          state.copyWith(
            errorMessage: e.message,
          ),
        );
      },
    );
  }

  void _startCountdown() {
    _countdownTimer?.cancel();
    _countdownTimer = Timer.periodic(
      const Duration(seconds: 1),
      (_) => add(
        const LoginEvent.tickCountdown(),
      ),
    );
  }

  void _tickCountdown(
    _TickCountdown event,
    Emitter<LoginState> emit,
  ) {
    final next = state.resendCountdown - 1;
    if (next <= 0) {
      _countdownTimer?.cancel();
      _countdownTimer = null;
    }
    emit(
      state.copyWith(
        resendCountdown: next <= 0 ? 0 : next,
      ),
    );
  }

  @override
  Future<void> close() {
    _countdownTimer?.cancel();
    return super.close();
  }
}
