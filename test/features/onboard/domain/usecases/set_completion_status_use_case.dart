import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sinergy_hub/features/onboard_survey/domain/models/onboard_status/onboard_status.dart';
import 'package:sinergy_hub/features/onboard_survey/domain/use_cases/set_completion_status_use_case.dart';

import '../../../auth/data/repositories/auth_repository_mock.dart';
import '../../data/repositories/onboard_survey_repository_mock.dart';

void main() {
  test(
    'If properly call SetCompletionStatusUseCase',
    () async {
      /// arrange

      final uid = 'uid';
      final status = OnboardStatus();
      final authRepository = AuthRepositoryMock();
      final onboardRepository = OnboardSurveyRepositoryMock();
      final setCompletionStatusUseCase = SetCompletionStatusUseCase(
        onboardSurveyRepository: onboardRepository,
        authRepository: authRepository,
      );

      when(
        () => authRepository.requireUserId(),
      ).thenAnswer(
        (_) async => uid,
      );
      when(
        () => onboardRepository.setCompletionStatus(
          status: status,
          uid: uid,
        ),
      ).thenAnswer(
        (_) async {},
      );

      /// act

      await setCompletionStatusUseCase.call(
        status: status,
      );

      /// assert

      verify(
        () => authRepository.requireUserId(),
      ).called(
        1,
      );
      verify(
        () => onboardRepository.setCompletionStatus(
          status: status,
          uid: uid,
        ),
      ).called(
        1,
      );
    },
  );
}
