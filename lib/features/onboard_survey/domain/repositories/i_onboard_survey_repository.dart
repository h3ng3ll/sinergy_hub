import '../models/onboard_status/onboard_status.dart';
import '../models/user_profiler/user_profiler.dart';

abstract class IOnboardSurveyRepository {
  Future<void> updateUserProfileData({
    required UserProfiler userProfiler,
    required String uid,
  });

  Future<bool> isExistsProfilerData({
    required String uid,
  });

  Future<UserProfiler> getProfilerData({
    required String uid,
  });

  Future<void> setCompletionStatus({
    required OnboardStatus status,
    required String uid,
  });

  Future<OnboardStatus?> getCompletionStatus({
    required String uid,
  });
}
