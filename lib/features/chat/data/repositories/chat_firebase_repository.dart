import '../../../../core/services/firebase/firebase_firestore_service.dart';
import '../../domain/models/chat/chat.dart';
import '../../domain/repositories/i_chat_repository.dart';
import '../models/chat_dto/chat_dto.dart';

class ChatFirebaseRepository implements IChatRepository {
  final FirebaseFirestoreService _firebaseFirestoreService;

  ChatFirebaseRepository({
    required FirebaseFirestoreService firebaseFirestoreService,
  }) : _firebaseFirestoreService = firebaseFirestoreService;

  ColRef get _chats => _firebaseFirestoreService.chats();

  @override
  Future<Chat> create(Chat chat) async {
    final String id = _firebaseFirestoreService.chats().doc().id;
    await _chats
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
    return _chats.snapshots().map(
      (e) => e.docs
          .where(
            (e) {
              if (!e.data().containsKey('participants')) {
                return false;
              }
              return (e.data()['participants'] as List).contains(
                uid,
              );
            },
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
  Stream<ChatDto> listenByIdStream({
    required String uid,
    required String chatId,
  }) {
    return _chats
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
    return await _chats
        .doc(
          chat.chatId,
        )
        .update(
          chat.toJson(),
        );
  }

  @override
  Future<List<ChatDto>> search({
    required String uid,
    required String query,
  }) async {
    final res = await _chats
        .where(
          'participants',
          arrayContains: uid,
        )
        .where(
          'keywords',
          arrayContains: query,
        )
        .get();

    final chats = res.docs
        .map(
          (e) => ChatDto.fromJson(
            e.data(),
          ),
        )
        .toList();

    return chats;
  }

  @override
  Future<ChatDto> getById({
    required String chatId,
  }) async {
    final chatRow = await _chats
        .doc(
          chatId,
        )
        .get();

    final chat = ChatDto.fromJson(
      chatRow.data()!,
    );
    return chat;
  }

  @override
  Future<ChatDto?> chatByParticipates({
    required List<String> participates,
  }) async {
    final chatRow = await _chats
        .where(
          'participants',
          isEqualTo: participates,
        )
        .limit(
          1,
        )
        .get();
    if (chatRow.docs.isEmpty) {
      return null;
    }
    final chat = ChatDto.fromJson(
      chatRow.docs.first.data(),
    );
    return chat;
  }
}
