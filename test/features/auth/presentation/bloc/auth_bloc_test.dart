import 'dart:async';

import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sinergy_hub/features/auth/domain/exception/failed_sign_with_google.dart';
import 'package:sinergy_hub/features/auth/presentation/bloc/auth_bloc/auth_bloc.dart';

import '../../data/repositories/auth_repository_mock.dart';



class FakeUser extends Fake implements User {}

void main() {
  late AuthRepositoryMock authRepository;
  late AuthBloc authBloc;

  setUpAll(() {
    registerFallbackValue(FakeUser());
  });

  setUp(() {
    authRepository = AuthRepositoryMock();
    authBloc = AuthBloc(authRepository: authRepository);
  });

  tearDown(() {
    authBloc.close();
  });

  group('AuthBloc', () {

    // ================= INIT =================

    blocTest<AuthBloc, AuthState>(
      'Init → loading → authorized (коли користувач авторизований)',
      build: () {
        when(() => authRepository.isAuthorized())
            .thenAnswer((_) async => true);
        return authBloc;
      },
      act: (bloc) => bloc.add(const AuthEvent.init()),
      expect: () => [
        const AuthState(status: AuthStatus.loading),
        const AuthState(status: AuthStatus.authorized),
      ],
    );

    blocTest<AuthBloc, AuthState>(
      'Init → loading → logout (коли не авторизований)',
      build: () {
        when(() => authRepository.isAuthorized())
            .thenAnswer((_) async => false);
        return authBloc;
      },
      act: (bloc) => bloc.add(const AuthEvent.init()),
      expect: () => [
        const AuthState(status: AuthStatus.loading),
        const AuthState(status: AuthStatus.logout),
      ],
    );

    blocTest<AuthBloc, AuthState>(
      'Init → loading → failed (при помилці)',
      build: () {
        when(() => authRepository.isAuthorized())
            .thenThrow(Exception('error'));
        return authBloc;
      },
      act: (bloc) => bloc.add(const AuthEvent.init()),
      expect: () => [
        const AuthState(status: AuthStatus.loading),
        isA<AuthState>().having(
              (s) => s.status,
          'status',
          AuthStatus.failed,
        ),
      ],
    );

    // ================= LISTEN =================

    blocTest<AuthBloc, AuthState>(
      'Listen → authorized коли приходить user',
      build: () {
        final controller = StreamController<User?>();

        when(() => authRepository.watchUser())
            .thenAnswer((_) => controller.stream);

        // додаємо значення після запуску
        Future.microtask(() {
          controller.add(FakeUser());
        });

        return authBloc;
      },
      act: (bloc) => bloc.add(const AuthEvent.listen()),
      expect: () => [
        isA<AuthState>().having(
              (s) => s.status,
          'status',
          AuthStatus.authorized,
        ),
      ],
    );

    blocTest<AuthBloc, AuthState>(
      'Listen → logout коли user null',
      build: () {
        final controller = StreamController<User?>();

        when(() => authRepository.watchUser())
            .thenAnswer((_) => controller.stream);

        Future.microtask(() {
          controller.add(null);
        });

        return authBloc;
      },
      act: (bloc) => bloc.add(const AuthEvent.listen()),
      expect: () => [
        isA<AuthState>().having(
              (s) => s.status,
          'status',
          AuthStatus.logout,
        ),
      ],
    );

    // ================= SIGN IN =================

    blocTest<AuthBloc, AuthState>(
      'SignIn → loading (успішний виклик без помилки)',
      build: () {
        when(() => authRepository.signInWithGoogle())
            .thenAnswer((_) async => const Left(null));
        return authBloc;
      },
      act: (bloc) => bloc.add(const AuthEvent.signInViaGoogle()),
      expect: () => [
        const AuthState(status: AuthStatus.loading),
      ],
    );

    blocTest<AuthBloc, AuthState>(
      'SignIn → loading → failed (при помилці)',
      build: () {

        when(() => authRepository.signInWithGoogle())
            .thenAnswer((_) async => Right(FailedSignWithGoogle()));
        return authBloc;
      },
      act: (bloc) => bloc.add(const AuthEvent.signInViaGoogle()),
      expect: () => [
        const AuthState(status: AuthStatus.loading),
        isA<AuthState>().having(
              (s) => s.status,
          'status',
          AuthStatus.failed,
        ),
      ],
    );

    // ================= SIGN OUT =================

    blocTest<AuthBloc, AuthState>(
      'SignOut викликає repository.signOut',
      build: () {
        when(() => authRepository.signOut())
            .thenAnswer((_) async {});
        return authBloc;
      },
      act: (bloc) => bloc.add(const AuthEvent.signOut()),
      verify: (_) {
        verify(() => authRepository.signOut()).called(1);
      },
    );

    blocTest<AuthBloc, AuthState>(
      'SignOut → failed при помилці',
      build: () {
        when(() => authRepository.signOut())
            .thenThrow(Exception('fail'));
        return authBloc;
      },
      act: (bloc) => bloc.add(const AuthEvent.signOut()),
      expect: () => [
        isA<AuthState>().having(
              (s) => s.status,
          'status',
          AuthStatus.failed,
        ),
      ],
    );
  });
}