import 'dart:typed_data';

import '../../../auth/domain/repostories/i_auth_repository.dart';
import '../../../onboard_survey/domain/models/user_profiler/user_profiler.dart';
import '../models/user_data/user_data.dart';
import '../repositories/i_user_repository.dart';

class UpdateUserProfilerUseCase {
  final IUserRepository _userRepository;
  final IAuthRepository _authRepository;

  UpdateUserProfilerUseCase({
    required IUserRepository userRepository,
    required IAuthRepository authRepository,
  }) : _userRepository = userRepository,
       _authRepository = authRepository;

  Future<void> call(
    UserProfiler userProfiler,
  ) async {
    final uid = await _authRepository.requireUserId();
    await _userRepository.setUserProfiler(
      uid: uid,
      userProfiler: userProfiler,
    );
  }
}
