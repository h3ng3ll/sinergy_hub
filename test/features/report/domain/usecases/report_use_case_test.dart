import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sinergy_hub/core/services/firebase/firebase_functions_service.dart';
import 'package:sinergy_hub/features/report/domain/failures/report_failure.dart';
import 'package:sinergy_hub/features/report/domain/repositories/i_report_repository.dart';
import 'package:sinergy_hub/features/report/domain/usecases/report_use_case.dart';

class MockReportRepository extends Mock implements IReportRepository {}

void main() {
  late MockReportRepository repo;
  late ReportUserUseCase useCase;

  const reportedUserId = 'bad-user';
  const reason = 'spam';
  const details = 'sending scam links';

  setUp(() {
    repo = MockReportRepository();
    useCase = ReportUserUseCase(reportRepository: repo);
  });

  void stubReport(void Function() behaviour) {
    when(
      () => repo.report(
        reportedUserId: any(named: 'reportedUserId'),
        reason: any(named: 'reason'),
        details: any(named: 'details'),
      ),
    ).thenAnswer((_) async => behaviour());
  }

  group('ReportUserUseCase', () {
    test('returns Left and forwards args on success', () async {
      stubReport(() {});

      final res = await useCase.call(
        reportedUserId: reportedUserId,
        reason: reason,
        details: details,
      );

      expect(res.isLeft(), isTrue);
      verify(
        () => repo.report(
          reportedUserId: reportedUserId,
          reason: reason,
          details: details,
        ),
      ).called(1);
    });

    test('maps resource-exhausted to ReportRateLimitedFailure', () async {
      when(
        () => repo.report(
          reportedUserId: any(named: 'reportedUserId'),
          reason: any(named: 'reason'),
          details: any(named: 'details'),
        ),
      ).thenThrow(FunctionResourceExhaustedException('rate limited'));

      final res = await useCase.call(
        reportedUserId: reportedUserId,
        reason: reason,
        details: details,
      );

      expect(res.isRight(), isTrue);
      res.fold(
        (_) => fail('expected a failure'),
        (failure) => expect(failure, isA<ReportRateLimitedFailure>()),
      );
    });

    test('maps any other error to ReportFailure', () async {
      when(
        () => repo.report(
          reportedUserId: any(named: 'reportedUserId'),
          reason: any(named: 'reason'),
          details: any(named: 'details'),
        ),
      ).thenThrow(Exception('boom'));

      final res = await useCase.call(
        reportedUserId: reportedUserId,
        reason: reason,
        details: details,
      );

      expect(res.isRight(), isTrue);
      res.fold(
        (_) => fail('expected a failure'),
        (failure) => expect(failure, isA<ReportFailure>()),
      );
    });
  });
}
