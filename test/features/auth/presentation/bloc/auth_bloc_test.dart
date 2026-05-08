import 'dart:async';

import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sinergy_hub/features/auth/domain/exception/failed_sign_with_google.dart';
import 'package:sinergy_hub/features/auth/presentation/bloc/auth_bloc/auth_bloc.dart';

import '../../../chats/domain/usecases/send_message_use_case_test.dart';
import '../../data/repositories/auth_repository_mock.dart';
import '../../domain/models/user_mock.dart';
import '../../domain/use_cases/apple_sign_in_use_case_mock.dart';
import '../../domain/use_cases/sign_in_with_google_use_case_mock.dart';

class FakeUser extends Fake implements User {}

void main() {
  late SignInWithGoogleUseCaseMock signInWithGoogleUseCaseMock;
  late AppleSignInUseCaseMock appleSignInUseCaseMock;
  late AuthRepositoryMock authRepository;
  late AuthBloc authBloc;

  setUpAll(() {
    registerFallbackValue(FakeUser());
  });

  setUp(
    () {
      signInWithGoogleUseCaseMock = SignInWithGoogleUseCaseMock();
      authRepository = AuthRepositoryMock();
      appleSignInUseCaseMock = AppleSignInUseCaseMock();
      authBloc = AuthBloc(
        authRepository: authRepository,
        signInWithGoogleUseCase: signInWithGoogleUseCaseMock,
        appleSignInUseCase: appleSignInUseCaseMock,
      );
    },
  );

  tearDown(() {
    authBloc.close();
  });

  group('AuthBloc', () {
    // ================= INIT =================

    blocTest<AuthBloc, AuthState>(
      'Init → loading → authorized (коли користувач авторизований)',
      build: () {
        when(() => authRepository.isAuthorized()).thenAnswer((_) async => true);
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
        when(
          () => authRepository.isAuthorized(),
        ).thenAnswer((_) async => false);
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
        when(() => authRepository.isAuthorized()).thenThrow(Exception('error'));
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

        when(
          () => authRepository.watchUser(),
        ).thenAnswer((_) => controller.stream);

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

        when(
          () => authRepository.watchUser(),
        ).thenAnswer((_) => controller.stream);

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
      'Listen → authorized',
      build: () {
        final controller = StreamController<User?>();

        final mockUser = UserMock();

        when(() => mockUser.emailVerified)
            .thenReturn(true);

        when(
              () => authRepository.watchUser(),
        ).thenAnswer((_) => controller.stream);

        Future.microtask(() {
          controller.add(mockUser);
        });

        return authBloc;
      },
      act: (bloc) => bloc.add(const AuthEvent.listen()),
      expect: () => [
        isA<AuthState>()
            .having(
              (s) => s.status,
          'status',
          AuthStatus.authorized,
        )
            .having(
              (s) => s.isEmailVerified,
          'verified',
          true,
        ),
      ],
    );
    blocTest<AuthBloc, AuthState>(
      'SignIn → loading (успішний виклик без помилки)',
      build: () {
        when(
          () => authRepository.signInWithGoogle(),
        ).thenAnswer((_) async => const Left(null));
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
        when(
          () => authRepository.signInWithGoogle(),
        ).thenAnswer((_) async => Right(FailedSignWithGoogle()));
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
        when(() => authRepository.signOut()).thenAnswer((_) async {});
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
        when(() => authRepository.signOut()).thenThrow(Exception('fail'));
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
