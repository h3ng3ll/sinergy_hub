import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sinergy_hub/features/onboard_survey/domain/models/onboard_status/onboard_status.dart';
import 'package:sinergy_hub/features/onboard_survey/domain/use_cases/get_completion_status_use_case.dart';
import 'package:sinergy_hub/features/onboard_survey/domain/use_cases/set_completion_status_use_case.dart';
import 'package:sinergy_hub/features/onboard_survey/presentation/bloc/onboard_bloc/onboard_bloc.dart';

import '../data/repositories/onboard_survey_repository_mock.dart';
import '../../auth/data/repositories/auth_repository_mock.dart';

void main() {
  late OnboardSurveyRepositoryMock repo;
  late AuthRepositoryMock authRepo;
  late GetCompletionStatusUseCase getUseCase;
  late SetCompletionStatusUseCase setUseCase;
  late OnboardBloc bloc;

  const uid = 'uid-1';

  setUpAll(() {
    registerFallbackValue(const OnboardStatus());
  });

  setUp(() {
    repo = OnboardSurveyRepositoryMock();
    authRepo = AuthRepositoryMock();
    when(() => authRepo.requireUserId()).thenAnswer((_) async => uid);

    getUseCase = GetCompletionStatusUseCase(
      onboardSurveyRepository: repo,
      authRepository: authRepo,
    );
    setUseCase = SetCompletionStatusUseCase(
      onboardSurveyRepository: repo,
      authRepository: authRepo,
    );

    bloc = OnboardBloc(
      getUserCompletionStatusUseCase: getUseCase,
      setUserCompletionStatusUseCase: setUseCase,
    );
  });

  tearDown(() => bloc.close());

  group('OnboardBloc.load', () {
    blocTest<OnboardBloc, OnboardState>(
      'emits loading then loaded with fetched status',
      build: () {
        when(() => repo.getCompletionStatus(uid: uid)).thenAnswer(
          (_) async => const OnboardStatus(
            toldAboutYourself: true,
            completeSpecialization: false,
          ),
        );
        return bloc;
      },
      act: (b) => b.add(const OnboardEvent.load()),
      expect: () => [
        const OnboardState(
          onboardStatus: OnboardStatus(),
          status: EOnboardStatus.loading,
        ),
        const OnboardState(
          onboardStatus: OnboardStatus(
            toldAboutYourself: true,
          ),
          status: EOnboardStatus.loaded,
        ),
      ],
    );

    blocTest<OnboardBloc, OnboardState>(
      'falls back to current status when repo returns null',
      build: () {
        when(() => repo.getCompletionStatus(uid: uid))
            .thenAnswer((_) async => null);
        return bloc;
      },
      act: (b) => b.add(const OnboardEvent.load()),
      expect: () => [
        const OnboardState(
          onboardStatus: OnboardStatus(),
          status: EOnboardStatus.loading,
        ),
        const OnboardState(
          onboardStatus: OnboardStatus(),
          status: EOnboardStatus.loaded,
        ),
      ],
    );

    blocTest<OnboardBloc, OnboardState>(
      'emits failed on repo throw',
      build: () {
        when(() => repo.getCompletionStatus(uid: uid))
            .thenThrow(Exception('boom'));
        return bloc;
      },
      act: (b) => b.add(const OnboardEvent.load()),
      expect: () => [
        const OnboardState(
          onboardStatus: OnboardStatus(),
          status: EOnboardStatus.loading,
        ),
        isA<OnboardState>()
            .having((s) => s.status, 'status', EOnboardStatus.failed)
            .having((s) => s.errorMessage, 'errorMessage', contains('boom')),
      ],
    );
  });

  group('OnboardBloc.update', () {
    blocTest<OnboardBloc, OnboardState>(
      'merges toldAboutYourself, persists, then emits loaded',
      build: () {
        when(() => repo.setCompletionStatus(
              status: any(named: 'status'),
              uid: uid,
            )).thenAnswer((_) async {});
        return bloc;
      },
      act: (b) => b.add(
        const OnboardEvent.update(toldAboutYourself: true),
      ),
      expect: () => [
        const OnboardState(
          onboardStatus: OnboardStatus(),
          status: EOnboardStatus.loading,
        ),
        const OnboardState(
          onboardStatus: OnboardStatus(toldAboutYourself: true),
          status: EOnboardStatus.loaded,
        ),
      ],
      verify: (_) {
        verify(() => repo.setCompletionStatus(
              status: const OnboardStatus(toldAboutYourself: true),
              uid: uid,
            )).called(1);
      },
    );

    blocTest<OnboardBloc, OnboardState>(
      'preserves prior fields when only one is updated',
      build: () {
        when(() => repo.setCompletionStatus(
              status: any(named: 'status'),
              uid: uid,
            )).thenAnswer((_) async {});
        return bloc;
      },
      seed: () => const OnboardState(
        onboardStatus: OnboardStatus(toldAboutYourself: true),
        status: EOnboardStatus.loaded,
      ),
      act: (b) => b.add(
        const OnboardEvent.update(completeSpecialization: true),
      ),
      expect: () => [
        const OnboardState(
          onboardStatus: OnboardStatus(toldAboutYourself: true),
          status: EOnboardStatus.loading,
        ),
        const OnboardState(
          onboardStatus: OnboardStatus(
            toldAboutYourself: true,
            completeSpecialization: true,
          ),
          status: EOnboardStatus.loaded,
        ),
      ],
    );

  });

  group('OnboardState.isLoaded', () {
    test('true only when status == loaded', () {
      const initial = OnboardState(onboardStatus: OnboardStatus());
      expect(initial.isLoaded, isFalse);
      expect(
        const OnboardState(
          onboardStatus: OnboardStatus(),
          status: EOnboardStatus.loaded,
        ).isLoaded,
        isTrue,
      );
    });
  });
}
