part of 'report_bloc.dart';

extension ReportStateX on ReportState {
  bool get isInitial => status == EReportStatus.initial;

  bool get isSubmitting => status == EReportStatus.submitting;

  bool get isSuccess => status == EReportStatus.success;

  bool get isFailed => status == EReportStatus.failed;

  bool get isRateLimited => status == EReportStatus.rateLimited;
}
