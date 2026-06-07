part of 'report_bloc.dart';

@freezed
sealed class ReportEvent with _$ReportEvent {
  const factory ReportEvent.submit({
    required String reason,
    required String details,
  }) = _Submit;
}
