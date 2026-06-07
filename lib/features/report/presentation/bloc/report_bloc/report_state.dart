part of 'report_bloc.dart';

enum EReportStatus {
  initial,
  submitting,
  success,
  failed,
  rateLimited,
}

@freezed
sealed class ReportState with _$ReportState {
  const factory ReportState({
    @Default(EReportStatus.initial) EReportStatus status,
    @Default('') String errorMessage,
  }) = _ReportState;
}
