import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../core/services/firebase/firebase_firestore_service.dart';
import '../../domain/models/chat_message/chat_message.dart';
import '../../domain/repositories/i_chat_message_repository.dart';
import '../models/chat_message_dto/chat_message_dto.dart';

/// Upper bound of messages delivered by one catch-up listener, so a user
/// returning after a long absence never pulls an unbounded history at once.
const int _kSinceSafetyLimit = 200;

class ChatMessageFirebaseRepository extends IChatMessageRepository {
  final FirebaseFirestoreService _firebaseFirestoreService;

  ChatMessageFirebaseRepository({
    required this._firebaseFirestoreService,
  });

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
        .set({
          ...message.toJson(),
          'createdAt': FieldValue.serverTimestamp(),
        });
    return message;
  }

  @override
  Stream<List<ChatMessage>> getLastMessagesStream({
    required String uid,
    required String chatId,
  }) => _firebaseFirestoreService.authGated(
    (uid) =>
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
                      (change) => change.doc['createdAt'] != null,
                    )
                    .map(
                      (change) {
                        final data = change.doc.data()!;
                        final message = ChatMessageDto.fromJson(
                          data,
                        );
                        return message.toDomain(
                          uid: uid,
                        );
                      },
                    )
                    .toList();
              },
            ),
  );

  List<ChatMessage> _changedMessages(
    QuerySnap snapshot,
    String uid,
  ) => snapshot.docChanges
      .where(
        (change) =>
            change.type != DocumentChangeType.removed &&
            change.doc['createdAt'] != null,
      )
      .map(
        (change) =>
            ChatMessageDto.fromJson(
              change.doc.data()!,
            ).toDomain(
              uid: uid,
            ),
      )
      .toList();

  @override
  Stream<List<ChatMessage>> listenMessagesSince({
    required String chatId,
    DateTime? after,
  }) => _firebaseFirestoreService.authGated(
    (uid) {
      final Query<Map<String, dynamic>> query = after == null
          ? _messages(chatId)
                .orderBy('createdAt', descending: true)
                .limit(kChatMessagesPageSize)
          : _messages(chatId)
                .where(
                  'createdAt',
                  isGreaterThanOrEqualTo: Timestamp.fromDate(after),
                )
                .orderBy('createdAt')
                .limitToLast(_kSinceSafetyLimit);
      return query.snapshots().map(
        (snapshot) => _changedMessages(snapshot, uid),
      );
    },
  );

  @override
  Future<List<ChatMessage>> fetchMessagesBefore({
    required String uid,
    required String chatId,
    required DateTime before,
    int limit = kChatMessagesPageSize,
  }) async {
    final snapshot = await _messages(chatId)
        .where(
          'createdAt',
          isLessThan: Timestamp.fromDate(before),
        )
        .orderBy('createdAt', descending: true)
        .limit(limit)
        .get();
    return snapshot.docs
        .map(
          (doc) =>
              ChatMessageDto.fromJson(
                doc.data(),
              ).toDomain(
                uid: uid,
              ),
        )
        .toList();
  }
}
