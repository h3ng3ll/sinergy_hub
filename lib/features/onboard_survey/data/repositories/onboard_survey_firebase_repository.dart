import '../../../../core/services/firebase/firebase_firestore_service.dart';
import '../../doman/models/user_profiler/user_profiler.dart';
import '../../doman/repositories/i_onboard_survey_repository.dart';

class OnboardSurveyFirebaseRepository extends IOnboardSurveyRepository {
  final FirebaseFirestoreService _firebaseFirestoreService;

  OnboardSurveyFirebaseRepository({
    required FirebaseFirestoreService firebaseFirestoreService,
  }) : _firebaseFirestoreService = firebaseFirestoreService;

  DocRef _onBoardDoc({
    required String uid,
  }) => _firebaseFirestoreService.userDocument(
    uid,
  )
  // .collection(
  //   'onBoard',
  // )
  // .doc(
  //   'onBoard',
  // )
  ;

  @override
  Future<void> updateUserProfileData({
    required UserProfiler userProfiler,
    required String uid,
  }) async {
    await _firebaseFirestoreService.updateDocument(
      _onBoardDoc(
        uid: uid,
      ),
      {
        'profiler': userProfiler.toJson(),
      },
    );
  }

  @override
  Future<UserProfiler> getProfilerData({
    required String uid,
  }) async {
    final profiler = await _onBoardDoc(
      uid: uid,
    ).get();
    final userProfiler = UserProfiler.fromJson(
      profiler.data()!,
    );
    return userProfiler;
  }

  @override
  Future<bool> isExistsProfilerData({
    required String uid,
  }) async {
    final isExists = await _firebaseFirestoreService.isExistsDocument(
      _onBoardDoc(
        uid: uid,
      ),
    );
    if (!isExists) return false;

    final profiler = await _onBoardDoc(
      uid: uid,
    ).get();

    return profiler.data()?.containsKey(
          'profiler',
        ) ??
        false;
  }
}
