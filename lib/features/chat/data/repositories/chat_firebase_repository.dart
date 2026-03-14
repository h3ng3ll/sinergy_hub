import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../core/services/firebase/firebase_firestore_service.dart';
import '../../domain/models/chat/chat.dart';
import '../../domain/models/chat_config/chat_config.dart';
import '../../domain/models/chat_pg_state.dart/chat_pg_state.dart';
import '../../domain/models/e_chat_filter.dart';
import '../../domain/repositories/i_chat_repository.dart';
import '../exception/chat_no_data_exception.dart';
import '../models/chat_config_dto/chat_config_dto.dart';
import '../models/chat_dto/chat_dto.dart';
import '../models/chat_dto_pg_state.dart/chat_dto_pg_state.dart';

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
          ChatDto.fromDomain(
                chat,
                uid,
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
  Future<ChatDtoPgState> get({
    required String uid,
    required ChatPgState chatState,
    String? query,
    EChatFilter filter = EChatFilter.all,
  }) async {
    List<ChatDto> chats = [];

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
            return ChatDto.fromJson(
              doc.data() as Map<String, dynamic>,
            );
          },
        )
        .where(
          (e) {
            if (filter == EChatFilter.favorite) {
              return e.config.favorite.contains(
                uid,
              );
            } else if (filter == EChatFilter.archived) {
              return e.config.archived.contains(
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
        (chat) {
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

    return ChatDtoPgState(
      pageSize: chatState.pageSize,
      chats: chats,
      hasMore: data.docs.isNotEmpty,
      lastDocument: data.docs.isEmpty ? chatState.lastDocument : data.docs.last,
    );
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

  @override
  Future<void> updateConfig({
    required String uid,
    required String chatId,
    required ChatConfig config,
  }) async {
    final updates = <String, dynamic>{};

    updates['config.favorite'] = config.favorite
        ? FieldValue.arrayUnion([uid])
        : FieldValue.arrayRemove([uid]);

    updates['config.archived'] = config.archived
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
    final config = ChatConfigDto.fromJson(
      data.data()!['config'],
    );
    return config.toDomain(
      uid,
    );
  }

  @override
  Stream<ChatDto> chatUpdates({
    required String uid,
  }) async* {
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
          yield ChatDto.fromJson(
            change.doc.data()!,
          );
        }
      }
    }
  }
}
