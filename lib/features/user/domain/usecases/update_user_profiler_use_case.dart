import '../../../auth/domain/repostories/i_auth_repository.dart';
import '../../../onboard_survey/domain/models/user_profiler/user_profiler.dart';
import '../repositories/i_user_write_repository.dart';

class UpdateUserProfilerUseCase {
  final IUserWriteRepository _userWriteRepository;
  final IAuthRepository _authRepository;

  UpdateUserProfilerUseCase({
    required IUserWriteRepository userWriteRepository,
    required IAuthRepository authRepository,
  }) : _userWriteRepository = userWriteRepository,
       _authRepository = authRepository;

  Future<void> call(
    UserProfiler userProfiler,
  ) async {
    final uid = await _authRepository.requireUserId();
    await _userWriteRepository.setUserProfiler(
      uid: uid,
      userProfiler: userProfiler,
    );
  }
}
