import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/repostories/i_auth_repository.dart';

part 'auth_event.dart';

part 'auth_state.dart';

part 'auth_bloc.freezed.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final IAuthRepository _authRepository;

  AuthBloc({
    required IAuthRepository authRepository,
  }) : _authRepository = authRepository,
       super(const AuthState()) {
    on<_Init>(_init);
    on<_Listen>(_listen);
    on<_SignInViaGoogle>(_signInViaGoogle);
    on<_SignOut>(_signOut);
  }

  Future<void> _listen(
    _Listen event,
    Emitter<AuthState> emit,
  ) async {
    await emit.forEach(
      _authRepository.watchUser(),
      onData: (User? user) {
        return state.copyWith(
          user: user,
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
      rethrow;
    }
  }

  void _signInViaGoogle(
    _SignInViaGoogle event,
    Emitter<AuthState> emit,
  ) async {
    try {
      emit(
        state.copyWith(
          status: AuthStatus.loading,
        ),
      );

      await _authRepository.signInWithGoogle();

      emit(
        state.copyWith(
          status: AuthStatus.authorized,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: AuthStatus.failed,
          errorMessage: e.toString(),
        ),
      );
      rethrow;
    }
  }

  void _signOut(
    _SignOut event,
    Emitter<AuthState> emit,
  ) async {
    try {
      emit(
        state.copyWith(
          status: AuthStatus.loading,
        ),
      );
      await _authRepository.signOut();

      emit(
        state.copyWith(
          status: AuthStatus.logout,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: AuthStatus.failed,
          errorMessage: e.toString(),
        ),
      );
      rethrow;
    }
  }
}
