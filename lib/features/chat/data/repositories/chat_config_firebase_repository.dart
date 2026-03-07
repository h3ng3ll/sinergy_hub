import '../../../../core/services/firebase/firebase_firestore_service.dart';
import '../../domain/models/chat_config/chat_config.dart';
import '../../domain/repositories/i_chat_config_repository.dart';
import '../models/chat_config_dto/chat_config_dto.dart';

class ChatConfigFirebaseRepository implements IChatConfigRepository {
  final FirebaseFirestoreService _firebaseFirestoreService;

  ChatConfigFirebaseRepository({
    required FirebaseFirestoreService firebaseFirestoreService,
  }) : _firebaseFirestoreService = firebaseFirestoreService;

  ColRef _chatConfigs(
    String uid,
  ) => _firebaseFirestoreService
      .userDocument(
        uid,
      )
      .collection(
        'chats',
      );

  @override
  Future<ChatConfig?> getConfig({
    required String uid,
    required String chatId,
  }) async {
    final doc =
        await _chatConfigs(
              uid,
            )
            .doc(
              chatId,
            )
            .get();

    if (!doc.exists || doc.data() == null) {
      return null;
    }

    return ChatConfigDto.fromJson(
      doc.data()!,
    ).toDomain();
  }

  @override
  Stream<List<ChatConfig>> getConfigsStream(String uid) {
    return _chatConfigs(
      uid,
    ).snapshots().map(
      (snapshot) => snapshot.docs
          .map(
            (doc) => ChatConfigDto.fromJson(
              doc.data(),
            ).toDomain(),
          )
          .toList(),
    );
  }

  @override
  Future<void> updateConfig({
    required String uid,
    required ChatConfig config,
  }) async {
    await _chatConfigs(
          uid,
        )
        .doc(
          config.chatId,
        )
        .set(
          ChatConfigDto.fromDomain(
            config,
          ).toJson(),
        );
  }

  @override
  Future<List<ChatConfig>> getConfigs({
    required String uid,
  }) async {
    final snapshot = await _chatConfigs(
      uid,
    ).snapshots().last;

    final configs = snapshot.docs
        .map(
          (doc) => ChatConfigDto.fromJson(
            doc.data(),
          ).toDomain(),
        )
        .toList();

    return configs;
  }
}
