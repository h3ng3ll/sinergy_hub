import 'package:get_it/get_it.dart';

import '../../../user/domain/repositories/i_user_repository.dart';
import '../use_cases/look_for_matches_use_case.dart';

void initHomeFeature(GetIt getIt) {
  getIt.registerLazySingleton<LookForMatchesUseCase>(
    () => LookForMatchesUseCase(
      userRepository: getIt<IUserRepository>(),
    ),
  );
}
