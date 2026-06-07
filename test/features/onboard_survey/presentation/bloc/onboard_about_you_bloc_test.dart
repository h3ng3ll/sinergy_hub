import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sinergy_hub/features/auth/data/models/auth_temp_credentials/auth_temp_credentials.dart';
import 'package:sinergy_hub/features/onboard_survey/domain/use_cases/get_cached_auth_credentials_use_case.dart';
import 'package:sinergy_hub/features/onboard_survey/presentation/pages/onboard_about_you_page/bloc/onboard_about_you_bloc/onboard_about_you_bloc.dart';

class _MockGetCachedAuthCredentialsUseCase extends Mock
    implements GetCachedAuthCredentialsUseCase {}

void main() {
  late _MockGetCachedAuthCredentialsUseCase getCachedAuthCredentialsUseCase;

  setUp(() {
    getCachedAuthCredentialsUseCase = _MockGetCachedAuthCredentialsUseCase();
  });

  OnboardAboutYouBloc buildBloc() => OnboardAboutYouBloc(
    getCachedAuthCredentialsUseCase: getCachedAuthCredentialsUseCase,
  );

  group('OnboardAboutYouBloc.load', () {
    blocTest<OnboardAboutYouBloc, OnboardAboutYouState>(
      'emits ready with cached first/last name and email when cache present',
      build: () {
        when(() => getCachedAuthCredentialsUseCase()).thenReturn(
          AuthTempCredentials(
            firstName: 'Alex',
            lastName: 'Naumenko',
            email: 'alex@example.com',
          ),
        );
        return buildBloc();
      },
      act: (bloc) => bloc.add(const OnboardAboutYouEvent.load()),
      expect: () => [
        const OnboardAboutYouState(status: EOnboardAboutYouStatus.loading),
        const OnboardAboutYouState(
          status: EOnboardAboutYouStatus.ready,
          firstName: 'Alex',
          lastName: 'Naumenko',
          email: 'alex@example.com',
        ),
      ],
    );

    blocTest<OnboardAboutYouBloc, OnboardAboutYouState>(
      'emits ready with empty name fields when cache is empty',
      build: () {
        when(() => getCachedAuthCredentialsUseCase()).thenReturn(null);
        return buildBloc();
      },
      act: (bloc) => bloc.add(const OnboardAboutYouEvent.load()),
      expect: () => [
        const OnboardAboutYouState(status: EOnboardAboutYouStatus.loading),
        const OnboardAboutYouState(
          status: EOnboardAboutYouStatus.ready,
          firstName: '',
          lastName: '',
        ),
      ],
    );

    blocTest<OnboardAboutYouBloc, OnboardAboutYouState>(
      'emits failed when the use case throws',
      build: () {
        when(() => getCachedAuthCredentialsUseCase())
            .thenThrow(Exception('boom'));
        return buildBloc();
      },
      act: (bloc) => bloc.add(const OnboardAboutYouEvent.load()),
      errors: () => [isA<Exception>()],
      expect: () => [
        const OnboardAboutYouState(status: EOnboardAboutYouStatus.loading),
        isA<OnboardAboutYouState>()
            .having((s) => s.status, 'status', EOnboardAboutYouStatus.failed)
            .having((s) => s.errorMessage, 'errorMessage', contains('boom')),
      ],
    );
  });
}
