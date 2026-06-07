import 'package:dartz/dartz.dart';

import '../../../../core/failures/failure.dart';
import '../../../../core/services/firebase/firebase_functions_service.dart';
import '../failures/report_failure.dart';
import '../repositories/i_report_repository.dart';

class ReportUserUseCase {
  final IReportRepository _reportRepository;

  ReportUserUseCase({
    required IReportRepository reportRepository,
  }) : _reportRepository = reportRepository;

  /// Submits a report and orchestrates the failure mapping. The backend
  /// enforces the spam rate-limit; a `resource-exhausted` error is surfaced
  /// as a [ReportRateLimitedFailure] so the UI can show a distinct message.
  Future<Either<void, Failure>> call({
    required String reportedUserId,
    required String reason,
    required String details,
  }) async {
    try {
      await _reportRepository.report(
        reportedUserId: reportedUserId,
        reason: reason,
        details: details,
      );
      return const Left(null);
    } on FunctionResourceExhaustedException {
      return const Right(ReportRateLimitedFailure());
    } catch (_) {
      return const Right(ReportFailure());
    }
  }
}
