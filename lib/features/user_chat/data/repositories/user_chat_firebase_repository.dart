import '../../../../core/services/firebase/firebase_firestore_service.dart';
import '../../domain/repositories/i_user_chat_repository.dart';

class UserChatFirebaseRepository implements IUserChatRepository {
  final FirebaseFirestoreService _firebaseFirestoreService;

  UserChatFirebaseRepository({
    required FirebaseFirestoreService firebaseFirestoreService,
  }) : _firebaseFirestoreService = firebaseFirestoreService;

  ColRef _userChats({
    required String uid,
  }) => _firebaseFirestoreService
      .userDocument(uid)
      .collection(
        'chats',
      );

  @override
  Future<void> create({
    required String uid,
    required String chatId,
  }) async {
    await _userChats(
          uid: uid,
        )
        .doc(
          chatId,
        )
        .set(
          {},
        );
  }

  @override
  Future<List<String>> getChatIds({
    required String uid,
  }) async {
    final data = await _userChats(
      uid: uid,
    ).get();
    final chatIds = data.docs
        .map(
          (e) => e.id,
        )
        .toList();
    return chatIds;
  }
}
