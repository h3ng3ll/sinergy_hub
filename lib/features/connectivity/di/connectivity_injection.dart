import 'package:get_it/get_it.dart';

import '../../../core/services/connectivity_service.dart';
import '../presentation/bloc/connectivity_bloc/connectivity_bloc.dart';

void initConnectivityFeature(GetIt getIt) {
  getIt.registerLazySingleton<ConnectivityBloc>(
    () => ConnectivityBloc(
      connectivityService: getIt<ConnectivityService>(),
    ),
  );
}
