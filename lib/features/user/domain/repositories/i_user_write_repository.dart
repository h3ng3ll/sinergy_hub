import '../../../onboard_survey/domain/models/user_profiler/user_profiler.dart';
import '../models/user_data/user_data.dart';

abstract class IUserWriteRepository {
  Future<void> update({
    required UserData userData,
  });

  Future<void> setUserProfiler({
    required String uid,
    required UserProfiler userProfiler,
  });
}
