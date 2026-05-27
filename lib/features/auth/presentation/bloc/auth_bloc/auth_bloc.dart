import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/repostories/i_auth_repository.dart';
import '../../../domain/use_cases/apple_sign_in_use_case.dart';
import '../../../domain/use_cases/logout_use_case.dart';
import '../../../domain/use_cases/sign_in_with_google_use_case.dart';

part 'auth_event.dart';

part 'auth_state.dart';

part 'auth_bloc.freezed.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final IAuthRepository _authRepository;
  final SignInWithGoogleUseCase _signInWithGoogleUseCase;
  final AppleSignInUseCase _appleSignInUseCase;
  final LogoutUseCase _logoutUseCase;

  AuthBloc({
    required IAuthRepository authRepository,
    required SignInWithGoogleUseCase signInWithGoogleUseCase,
    required AppleSignInUseCase appleSignInUseCase,
    required LogoutUseCase logoutUseCase,
  }) : _authRepository = authRepository,
       _signInWithGoogleUseCase = signInWithGoogleUseCase,
        _appleSignInUseCase = appleSignInUseCase,
        _logoutUseCase = logoutUseCase,
       super(const AuthState()) {
    on<_Init>(_init);
    on<_Listen>(_listen);
    on<_SignInViaGoogle>(_signInViaGoogle);
    on<_SignOut>(_signOut);
    on<_SignInViaApple>(_signInViaApple);
  }

  Future<void> _listen(
    _Listen event,
    Emitter<AuthState> emit,
  ) async {
    await emit.forEach(
      _authRepository.watchUser(),
      onData: (User? user) {
        return state.copyWith(
          status: user == null ? AuthStatus.logout : AuthStatus.authorized,
          user: user,
          isEmailVerified: user?.emailVerified ?? false,
        );
      },
    );
  }

  void _init(
    _Init event,
    Emitter<AuthState> emit,
  ) async {
    try {
      emit(
        state.copyWith(
          status: AuthStatus.loading,
        ),
      );
      final status = await _authRepository.isAuthorized();

      emit(
        state.copyWith(
          status: status ? AuthStatus.authorized : AuthStatus.logout,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: AuthStatus.failed,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  void _signInViaGoogle(
    _SignInViaGoogle event,
    Emitter<AuthState> emit,
  ) async {
    emit(
      state.copyWith(
        status: AuthStatus.loading,
      ),
    );
    final res = await _signInWithGoogleUseCase.call();

    res.fold(
      (_) {},
      (e) {
        emit(
          state.copyWith(
            status: AuthStatus.failed,
            errorMessage: e.message,
          ),
        );
      },
    );
  }
void _signInViaApple(
    _SignInViaApple event,
    Emitter<AuthState> emit,
  ) async {
    emit(
      state.copyWith(
        status: AuthStatus.loading,
      ),
    );
    final res = await _appleSignInUseCase.call();

    res.fold(
      (_) {},
      (e) {
        emit(
          state.copyWith(
            status: AuthStatus.failed,
            errorMessage: e.message,
          ),
        );
      },
    );
  }

  void _signOut(
    _SignOut event,
    Emitter<AuthState> emit,
  ) async {
    try {
      await _logoutUseCase();
    } catch (e) {
      emit(
        state.copyWith(
          status: AuthStatus.failed,
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
