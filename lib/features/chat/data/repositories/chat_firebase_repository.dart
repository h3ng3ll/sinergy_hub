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
  Future<Chat> create(Chat chat) async {
    final String id = _firebaseFirestoreService.chats().doc().id;
    await _firebaseFirestoreService
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
    return chat.copyWith(
      chatId: id,
    );
  }

  @override
  Stream<List<ChatDto>> getStream(String uid) {
    return _firebaseFirestoreService.chats().snapshots().map(
      (e) => e.docs
          .where(
            (e) => (e.data()['participants'] as List).contains(
              uid,
            ),
          )
          .map(
            (doc) => ChatDto.fromJson(
              doc.data(),
            ),
          )
          .toList(),
    );
  }

  @override
  Stream<ChatDto> getByIdStream({
    required String uid,
    required String chatId,
  }) {
    return _firebaseFirestoreService
        .chats()
        .doc(
          chatId,
        )
        .snapshots()
        .map(
          (e) {
            final dto = ChatDto.fromJson(
              e.data()!,
            );
            return dto;
          },
        );
  }

  @override
  Future<void> update({
    required ChatDto chat,
  }) async {
    return await _firebaseFirestoreService
        .chats()
        .doc(
          chat.chatId,
        )
        .update(
          chat.toJson(),
        );
  }
}
