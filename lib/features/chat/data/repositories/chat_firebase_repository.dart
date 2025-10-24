import '../../../../core/services/firebase/firebase_firestore_service.dart';
import '../../domain/models/chat/chat.dart';
import '../../domain/repositories/i_chat_repository.dart';
import '../models/chat_dto/chat_dto.dart';

class ChatFirebaseRepository implements IChatRepository {
  final FirebaseFirestoreService _firebaseFirestoreService;

  ChatFirebaseRepository({
    required FirebaseFirestoreService firebaseFirestoreService,
  }) : _firebaseFirestoreService = firebaseFirestoreService;

  @override
  Future<void> create(Chat chat) async {
    final String id = _firebaseFirestoreService.chats().id;
    _firebaseFirestoreService
        .chats()
        .doc(
          id,
        )
        .set(
          ChatDto.fromDomain(
                chat,
              )
              .copyWith(
                chatId: id,
              )
              .toJson(),
        );
  }

  @override
  Stream<List<ChatDto>> get(String uid) {
    return _firebaseFirestoreService.chats().snapshots().map(
      (e) => e.docs
          .map(
            (doc) => ChatDto.fromJson(
              doc.data(),
            ),
          )
          .toList(),
    );
  }
}
