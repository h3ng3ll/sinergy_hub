import 'package:get_it/get_it.dart';

import '../../../core/services/firebase/firebase_functions_service.dart';
import '../data/repositories/report_firebase_repository.dart';
import '../domain/repositories/i_report_repository.dart';
import '../domain/usecases/report_use_case.dart';

void initReportFeature(GetIt getIt) {
  getIt.registerLazySingleton<IReportRepository>(
    () => ReportFirebaseRepository(
      firebaseFunctionsService: getIt<FirebaseFunctionsService>(),
    ),
  );

  getIt.registerLazySingleton<ReportUserUseCase>(
    () => ReportUserUseCase(
      reportRepository: getIt<IReportRepository>(),
    ),
  );
}
