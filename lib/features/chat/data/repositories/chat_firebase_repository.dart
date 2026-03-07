import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../core/services/firebase/firebase_firestore_service.dart';
import '../../domain/models/chat/chat.dart';
import '../../domain/repositories/i_chat_repository.dart';
import '../exception/chat_no_data_exception.dart';
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
  Future<List<ChatDto>> get({
    required String uid,
    String? query,
    List<String>? chatIds,
    int limit = 20,
    DocumentSnapshot? startAfterDoc,
  }) async {
    // 1. Если chatIds пустые, возвращаем сразу пустой список
    if (chatIds == null || chatIds.isEmpty) {
      return [];
    }

    final List<ChatDto> result = [];

    // 2. Firestore ограничивает whereIn до 10-30 элементов, делаем батчи
    const batchSize = 10;
    for (var i = 0; i < chatIds.length; i += batchSize) {
      final batchIds = chatIds.sublist(
        i,
        (i + batchSize).clamp(
          0,
          chatIds.length,
        ),
      );

      Query queryRef = _chats
          .where(
            'chatId',
            whereIn: batchIds,
          )
          .where(
            'participants',
            arrayContains: uid,
          )
          .orderBy(
            'lastMessageSent',
            descending: true,
          )
          .limit(
            limit,
          );

      // 3. Пагинация: если есть стартовый документ, продолжаем с него
      if (startAfterDoc != null) {
        queryRef = queryRef.startAfterDocument(
          startAfterDoc,
        );
      }

      final batchSnap = await queryRef.get();

      final List<ChatDto> batchChats = batchSnap.docs.map(
        (doc) {
          if (doc.data() == null) {
            throw ChatNoDataException();
          }
          return ChatDto.fromJson(
            doc.data() as Map<String, dynamic>,
          );
        },
      ).toList();

      result.addAll(batchChats);
    }

    // 4. Если query есть, фильтруем на клиенте по searchKeywords
    if (query != null && query.isNotEmpty) {
      return result.where(
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

    return result;
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
