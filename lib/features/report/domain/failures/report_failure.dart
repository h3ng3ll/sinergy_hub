import '../../../../core/failures/failure.dart';

/// Generic failure when a report could not be submitted.
class ReportFailure extends Failure {
  const ReportFailure([
    super.message = 'Could not submit the report. Please try again later.',
  ]);
}

/// The backend rejected the report because the user has submitted too many
/// reports in a short period (Cloud Function returns `resource-exhausted`).
class ReportRateLimitedFailure extends Failure {
  const ReportRateLimitedFailure([
    super.message =
        'You have submitted too many reports. Please try again later.',
  ]);
}
