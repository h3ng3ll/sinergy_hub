import 'package:get_it/get_it.dart';

import '../../../../core/services/firebase/firebase_firestore_service.dart';
import '../../../auth/domain/repostories/i_auth_repository.dart';
import '../../../auth/domain/services/i_webrtc_service.dart';
import '../../data/repositories/calls_firebase_repository.dart';
import '../repositories/i_calls_repository.dart';
import '../use_cases/accept_call_use_case.dart';
import '../use_cases/add_ice_candidate_call_use_case.dart';
import '../use_cases/decline_call_use_case.dart';
import '../use_cases/hang_up_call_use_case.dart';
import '../use_cases/listen_call_use_case.dart';
import '../use_cases/listen_candidate_use_case.dart';
import '../use_cases/start_call_use_case.dart';

void initCallsFeature(GetIt getIt) {
  getIt.registerLazySingleton<ICallsRepository>(
    () => CallsFirebaseRepository(
      firebaseFirestoreService: getIt<FirebaseFirestoreService>(),
    ),
  );
  getIt.registerLazySingleton<AcceptCallUseCase>(
    () => AcceptCallUseCase(
      callsRepository: getIt<ICallsRepository>(),
      webrtc: getIt<IWebRtcService>(),
    ),
  );
  getIt.registerLazySingleton<StartCallUseCase>(
    () => StartCallUseCase(
      callsRepository: getIt<ICallsRepository>(),
      webrtc: getIt<IWebRtcService>(),
      authRepository: getIt<IAuthRepository>(),
    ),
  );
  getIt.registerLazySingleton<HangUpCallUseCase>(
    () => HangUpCallUseCase(
      callsRepository: getIt<ICallsRepository>(),
      webrtc: getIt<IWebRtcService>(),
    ),
  );
  getIt.registerLazySingleton<ListenCallUseCase>(
    () => ListenCallUseCase(
      callsRepository: getIt<ICallsRepository>(),
      authRepository: getIt<IAuthRepository>(),
    ),
  );
  getIt.registerLazySingleton<DeclineCallUseCase>(
    () => DeclineCallUseCase(
      callsRepository: getIt<ICallsRepository>(),
      webrtc: getIt<IWebRtcService>(),
    ),
  );
  getIt.registerLazySingleton<ListenCandidateUseCase>(
    () => ListenCandidateUseCase(
      callsRepository: getIt<ICallsRepository>(),
      webrtc: getIt<IWebRtcService>(),
    ),
  );
  getIt.registerLazySingleton<AddIceCandidateCallUseCase>(
    () => AddIceCandidateCallUseCase(
      callsRepository: getIt<ICallsRepository>(),
      webrtc: getIt<IWebRtcService>(),
    ),
  );
}
