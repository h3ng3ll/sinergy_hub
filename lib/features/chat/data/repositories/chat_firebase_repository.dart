import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../core/services/firebase/firebase_firestore_service.dart';
import '../../domain/models/chat/chat.dart';
import '../../domain/models/chat_config/chat_config.dart';
import '../../domain/models/chat_pg_state.dart/chat_pg_state.dart';
import '../../domain/models/e_chat_filter.dart';
import '../../domain/repositories/i_chat_repository.dart';
import '../exception/chat_no_data_exception.dart';

class ChatFirebaseRepository implements IChatRepository {
  final FirebaseFirestoreService _firebaseFirestoreService;

  ChatFirebaseRepository({
    required FirebaseFirestoreService firebaseFirestoreService,
  }) : _firebaseFirestoreService = firebaseFirestoreService;

  ColRef get _chats => _firebaseFirestoreService.chats();

  @override
  Future<Chat> create(
    Chat chat,
    String uid,
  ) async {
    final String id = _firebaseFirestoreService.chats().doc().id;
    await _chats
        .doc(
          id,
        )
        .set(
          chat
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
  Stream<List<Chat>> getStream(String uid) {
    return _firebaseFirestoreService.authGated(
      (uid) => _chats.snapshots().map(
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
              (doc) => Chat.fromJson(
                doc.data(),
              ),
            )
            .toList(),
      ),
    );
  }

  @override
  Stream<Chat> listenByIdStream({
    required String uid,
    required String chatId,
  }) {
    return _firebaseFirestoreService.authGated(
      (uid) => _chats
          .doc(
            chatId,
          )
          .snapshots()
          .map(
            (e) {
              final dto = Chat.fromJson(
                e.data()!,
              );
              return dto;
            },
          ),
    );
  }

  @override
  Future<void> update({
    required Chat chat,
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
  Future<ChatPgState> get({
    required String uid,
    required ChatPgState chatState,
    String? query,
    EChatFilter filter = EChatFilter.all,
  }) async {
    List<Chat> chats = [];

    Query queryRef = _chats.where(
      'participants',
      arrayContains: uid,
    );

    queryRef = queryRef
        .limit(
          chatState.pageSize,
        )
        .orderBy(
          'lastMessageSent',
          descending: true,
        );
    if (chatState.lastDocument != null) {
      queryRef = queryRef.startAfterDocument(
        chatState.lastDocument!,
      );
    }
    final data = await queryRef.get();

    chats = data.docs
        .map(
          (doc) {
            if (doc.data() == null) {
              throw ChatNoDataException();
            }
            return Chat.fromJson(
              doc.data() as Map<String, dynamic>,
            );
          },
        )
        .where(
          (e) {
            if (filter == EChatFilter.favorite) {
              return e.isFavorite(
                uid,
              );
            } else if (filter == EChatFilter.archived) {
              return e.isArchived(
                uid,
              );
            }
            return true;
          },
        )
        .toList();

    // 4. Если query есть, фильтруем на клиенте по searchKeywords
    if (query != null && query.isNotEmpty) {
      chats = chats.where(
        (Chat chat) {
          final keywords = chat.searchKeywords
              .map(
                (k) => k.toLowerCase(),
              )
              .toList();

          if (keywords.isEmpty) return false;

          return keywords.contains(
            query.toLowerCase(),
          );
        },
      ).toList();
    }
    final modelChats = chats
        .map(
          (e) => e,
        )
        .toList();

    return ChatPgState(
      pageSize: chatState.pageSize,
      chats: [
        ...chatState.chats,
        ...modelChats,
      ],
      hasMore: data.docs.isNotEmpty,
      lastDocument: data.docs.isEmpty ? chatState.lastDocument : data.docs.last,
    );
  }

  @override
  Future<Chat> getById({
    required String chatId,
    required String uid,
  }) async {
    final chatRow = await _chats
        .doc(
          chatId,
        )
        .get();

    final chat = Chat.fromJson(
      chatRow.data()!,
    );
    return chat;
  }

  @override
  Future<Chat?> chatByParticipates({
    required String uid,
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
    final chat = Chat.fromJson(
      chatRow.docs.first.data(),
    );
    return chat;
  }

  @override
  Future<void> updateConfig({
    required String uid,
    required String chatId,
    required ChatConfig config,
  }) async {
    final updates = <String, dynamic>{};

    updates['config.favorite'] =
        config.isFavorite(
          uid,
        )
        ? FieldValue.arrayUnion([uid])
        : FieldValue.arrayRemove([uid]);

    updates['config.archived'] =
        config.isArchived(
          uid,
        )
        ? FieldValue.arrayUnion([uid])
        : FieldValue.arrayRemove([uid]);

    await _chats
        .doc(
          chatId,
        )
        .update(
          updates,
        );
  }

  @override
  Future<void> setBlocked({
    required String uid,
    required String chatId,
    required bool blocked,
  }) async {
    await _chats
        .doc(
          chatId,
        )
        .update(
          {
            'blocked.$uid': blocked,
          },
        );
  }

  @override
  Future<ChatConfig> getConfig({
    required String uid,
    required String chatId,
  }) async {
    final data = await _chats
        .doc(
          chatId,
        )
        .get();
    if (data.data() == null) {
      return ChatConfig();
    }
    final config = ChatConfig.fromJson(
      data.data()!['config'],
    );
    return config;
  }

  @override
  Stream<Chat> chatUpdates({
    required String uid,
  }) {
    return _firebaseFirestoreService.authGated(
      (uid) async* {
        await for (final snapshot
            in _chats
                .where(
                  'participants',
                  arrayContains: uid,
                )
                .snapshots()) {
          for (final change in snapshot.docChanges) {
            if (change.type == DocumentChangeType.modified ||
                change.type == DocumentChangeType.added) {
              yield Chat.fromJson(
                change.doc.data()!,
              );
            }
          }
        }
      },
    );
  }

  @override
  Future<void> updateTypeInfo({
    required String uid,
    required String chatId,
    required bool isTyping,
  }) async {
    _chats
        .doc(
          chatId,
        )
        .update(
          {
            'typingUsers': isTyping
                ? FieldValue.arrayUnion([uid])
                : FieldValue.arrayRemove([uid]),
          },
        );
  }
}
