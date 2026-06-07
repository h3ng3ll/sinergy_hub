import '../../../../core/services/firebase/firebase_functions_service.dart';
import '../../domain/repositories/i_report_repository.dart';

class ReportFirebaseRepository implements IReportRepository {
  final FirebaseFunctionsService _firebaseFunctionsService;

  ReportFirebaseRepository({
    required FirebaseFunctionsService firebaseFunctionsService,
  }) : _firebaseFunctionsService = firebaseFunctionsService;

  @override
  Future<void> report({
    required String reportedUserId,
    required String reason,
    required String details,
  }) async {
    await _firebaseFunctionsService.call(
      functionName: 'reportUser',
      data: {
        'reportedUserId': reportedUserId,
        'reason': reason,
        'details': details,
      },
    );
  }
}
