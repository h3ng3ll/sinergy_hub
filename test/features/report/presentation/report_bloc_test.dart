import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sinergy_hub/core/failures/failure.dart';
import 'package:sinergy_hub/features/report/domain/failures/report_failure.dart';
import 'package:sinergy_hub/features/report/domain/usecases/report_use_case.dart';
import 'package:sinergy_hub/features/report/presentation/bloc/report_bloc/report_bloc.dart';

class MockReportUserUseCase extends Mock implements ReportUserUseCase {}

void main() {
  late MockReportUserUseCase reportUserUseCase;

  const reportedUserId = 'bad-user';

  ReportBloc buildBloc() => ReportBloc(
        reportUserUseCase: reportUserUseCase,
        reportedUserId: reportedUserId,
      );

  setUp(() {
    reportUserUseCase = MockReportUserUseCase();
  });

  void stubResult(Either<void, Failure> result) {
    when(
      () => reportUserUseCase.call(
        reportedUserId: any(named: 'reportedUserId'),
        reason: any(named: 'reason'),
        details: any(named: 'details'),
      ),
    ).thenAnswer((_) async => result);
  }

  group('ReportBloc', () {
    test('emits submitting then success on Left', () async {
      stubResult(const Left(null));
      final bloc = buildBloc();
      final seen = <EReportStatus>[];
      final sub = bloc.stream.listen((s) => seen.add(s.status));

      bloc.add(const ReportEvent.submit(reason: 'spam', details: 'x'));
      await Future<void>.delayed(const Duration(milliseconds: 50));

      expect(seen, [EReportStatus.submitting, EReportStatus.success]);
      verify(
        () => reportUserUseCase.call(
          reportedUserId: reportedUserId,
          reason: 'spam',
          details: 'x',
        ),
      ).called(1);

      await sub.cancel();
      await bloc.close();
    });

    test('emits rateLimited on ReportRateLimitedFailure', () async {
      stubResult(const Right(ReportRateLimitedFailure()));
      final bloc = buildBloc();

      bloc.add(const ReportEvent.submit(reason: 'spam', details: 'x'));
      await Future.doWhile(() async {
        await Future<void>.delayed(Duration.zero);
        return bloc.state.status == EReportStatus.initial ||
            bloc.state.status == EReportStatus.submitting;
      }).timeout(const Duration(seconds: 2));

      expect(bloc.state.status, EReportStatus.rateLimited);

      await bloc.close();
    });

    test('emits failed on a generic failure', () async {
      stubResult(const Right(ReportFailure()));
      final bloc = buildBloc();

      bloc.add(const ReportEvent.submit(reason: 'spam', details: 'x'));
      await Future.doWhile(() async {
        await Future<void>.delayed(Duration.zero);
        return bloc.state.status == EReportStatus.initial ||
            bloc.state.status == EReportStatus.submitting;
      }).timeout(const Duration(seconds: 2));

      expect(bloc.state.status, EReportStatus.failed);
      expect(bloc.state.errorMessage, isNotEmpty);

      await bloc.close();
    });
  });
}
