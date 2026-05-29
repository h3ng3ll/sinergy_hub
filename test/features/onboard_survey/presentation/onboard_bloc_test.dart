import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sinergy_hub/features/onboard_survey/domain/models/onboard_status/onboard_status.dart';
import 'package:sinergy_hub/features/onboard_survey/domain/use_cases/get_completion_status_use_case.dart';
import 'package:sinergy_hub/features/onboard_survey/domain/use_cases/set_completion_status_use_case.dart';
import 'package:sinergy_hub/features/onboard_survey/presentation/bloc/onboard_bloc/onboard_bloc.dart';

class _GetCompletionStatusUseCaseMock extends Mock
    implements GetCompletionStatusUseCase {}

class _SetCompletionStatusUseCaseMock extends Mock
    implements SetCompletionStatusUseCase {}

void main() {
  late _GetCompletionStatusUseCaseMock getStatus;
  late _SetCompletionStatusUseCaseMock setStatus;

  // A prior user who finished onboarding — used to seed the singleton bloc
  // so we can prove the new user does NOT inherit this state.
  const completed = OnboardStatus(
    toldAboutYourself: true,
    completeSpecialization: true,
  );

  OnboardBloc build() => OnboardBloc(
    getUserCompletionStatusUseCase: getStatus,
    setUserCompletionStatusUseCase: setStatus,
  );

  setUp(() {
    getStatus = _GetCompletionStatusUseCaseMock();
    setStatus = _SetCompletionStatusUseCaseMock();
  });

  group('OnboardBloc.load', () {
    blocTest<OnboardBloc, OnboardState>(
      'null status (new user) → loaded with DEFAULT OnboardStatus, '
      'not the stale seeded one',
      build: () {
        when(() => getStatus.call()).thenAnswer((_) async => null);
        return build();
      },
      // Singleton already holds a previous user's completed status.
      seed: () => const OnboardState(onboardStatus: completed),
      act: (bloc) => bloc.add(const OnboardEvent.load()),
      expect: () => const [
        OnboardState(
          onboardStatus: completed,
          status: EOnboardStatus.loading,
        ),
        OnboardState(
          onboardStatus: OnboardStatus(),
          status: EOnboardStatus.loaded,
        ),
      ],
      verify: (bloc) {
        // The new user is treated as not onboarded → router sends to onboarding.
        expect(bloc.state.onboardStatus.toldAboutYourself, isFalse);
        expect(bloc.state.onboardStatus.completeSpecialization, isFalse);
      },
    );

    blocTest<OnboardBloc, OnboardState>(
      'real stored status → loaded with that status',
      build: () {
        when(() => getStatus.call()).thenAnswer((_) async => completed);
        return build();
      },
      act: (bloc) => bloc.add(const OnboardEvent.load()),
      expect: () => const [
        OnboardState(
          onboardStatus: OnboardStatus(),
          status: EOnboardStatus.loading,
        ),
        OnboardState(
          onboardStatus: completed,
          status: EOnboardStatus.loaded,
        ),
      ],
    );
  });

  group('OnboardBloc.reset', () {
    blocTest<OnboardBloc, OnboardState>(
      'reset → clears to default OnboardStatus from a completed state',
      build: build,
      seed: () => const OnboardState(
        onboardStatus: completed,
        status: EOnboardStatus.loaded,
      ),
      act: (bloc) => bloc.add(const OnboardEvent.reset()),
      expect: () => const [
        OnboardState(onboardStatus: OnboardStatus()),
      ],
    );
  });
}
