import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../core/services/firebase/firebase_firestore_service.dart';
import '../../domain/models/chat_message/chat_message.dart';
import '../../domain/repositories/i_chat_message_repository.dart';

class ChatMessageFirebaseRepository extends IChatMessageRepository {
  final FirebaseFirestoreService _firebaseFirestoreService;

  ChatMessageFirebaseRepository({
    required FirebaseFirestoreService firebaseFirestoreService,
  }) : _firebaseFirestoreService = firebaseFirestoreService;

  ColRef _messages(
    String chatId,
  ) => _firebaseFirestoreService
      .chats()
      .doc(
        chatId,
      )
      .collection(
        'messages',
      );

  @override
  Future<ChatMessage> create({
    required String chatId,
    required ChatMessage message,
  }) async {
    final messageId = _messages(
      chatId,
    ).doc().id;
    message = message.copyWith(
      id: messageId,
    );
    await _messages(
          chatId,
        )
        .doc(
          messageId,
        )
        .set(
          message.toJson(),
        );
    return message;
  }

  @override
  Stream<List<ChatMessage>> getLastMessagesStream({
    required String chatId,
  }) =>
      _messages(
            chatId,
          )
          .orderBy(
            'createdAt',
            descending: true,
          )
          .limit(
            30,
          )
          .snapshots()
          .map(
            (snapshot) {
              return snapshot.docChanges
                  .where(
                    (change) => change.type == DocumentChangeType.added,
                  )
                  .map(
                    (change) => ChatMessage.fromJson(
                      change.doc.data()!,
                    ),
                  )
                  .toList();
            },
          );
}
