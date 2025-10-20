import '../../../../core/services/firebase/firebase_firestore_service.dart';
import '../../domain/models/user_data/user_data.dart';
import '../../domain/repositories/i_user_data_repository.dart';

class UserDataFirebaseRepository extends IUserDataRepository {
  final FirebaseFirestoreService _firebaseFirestoreService;

  UserDataFirebaseRepository({
    required FirebaseFirestoreService firebaseFirestoreService,
  }) : _firebaseFirestoreService = firebaseFirestoreService;

  @override
  Future<List<UserData>> get() async {
    final res = await _firebaseFirestoreService.usersDocument.get();

    final userData = List<UserData>.from(
      res.docs.map(
        (e) => UserData.fromJson(
          e.data(),
        ),
      ),
    );
    return userData;
  }
}
