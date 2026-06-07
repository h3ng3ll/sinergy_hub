import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/failures/report_failure.dart';
import '../../../domain/usecases/report_use_case.dart';

part 'report_event.dart';

part 'report_state.dart';

part 'report_state_ext.dart';

part 'report_bloc.freezed.dart';

class ReportBloc extends Bloc<ReportEvent, ReportState> {
  final ReportUserUseCase _reportUserUseCase;
  final String _reportedUserId;

  ReportBloc({
    required ReportUserUseCase reportUserUseCase,
    required String reportedUserId,
  }) : _reportUserUseCase = reportUserUseCase,
       _reportedUserId = reportedUserId,
       super(const ReportState()) {
    on<_Submit>(
      _submit,
      transformer: droppable(),
    );
  }

  Future<void> _submit(
    _Submit event,
    Emitter<ReportState> emit,
  ) async {
    emit(
      state.copyWith(
        status: EReportStatus.submitting,
      ),
    );

    final result = await _reportUserUseCase.call(
      reportedUserId: _reportedUserId,
      reason: event.reason,
      details: event.details,
    );

    result.fold(
      (_) => emit(
        state.copyWith(
          status: EReportStatus.success,
        ),
      ),
      (failure) => emit(
        state.copyWith(
          status: failure is ReportRateLimitedFailure
              ? EReportStatus.rateLimited
              : EReportStatus.failed,
          errorMessage: failure.message,
        ),
      ),
    );
  }
}
