import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sinergy_hub/features/chat/domain/models/chat/chat.dart';
import 'package:sinergy_hub/features/chat/domain/models/chat_config/chat_config.dart';

void main() {
  Chat buildChat({Map<String, bool> blocked = const {}}) => Chat(
        chatId: 'chat-1',
        participants: const ['me', 'other'],
        lastMessageSent: DateTime(2026),
        createdAt: DateTime(2026),
        config: ChatConfig(),
        blocked: blocked,
      );

  group('ChatX block helpers', () {
    test('isBlockedBy is true only for a user whose key is true', () {
      final chat = buildChat(blocked: {'me': true});

      expect(chat.isBlockedBy('me'), isTrue);
      expect(chat.isBlockedBy('other'), isFalse);
    });

    test('absent key defaults to false', () {
      final chat = buildChat();

      expect(chat.isBlockedBy('me'), isFalse);
      expect(chat.isBlockedBy('other'), isFalse);
      expect(chat.anyBlocked, isFalse);
    });

    test('a key explicitly set to false is not blocked', () {
      final chat = buildChat(blocked: {'me': false});

      expect(chat.isBlockedBy('me'), isFalse);
      expect(chat.anyBlocked, isFalse);
    });

    test('anyBlocked is true when any participant blocked', () {
      expect(buildChat(blocked: {'me': true}).anyBlocked, isTrue);
      expect(buildChat(blocked: {'other': true}).anyBlocked, isTrue);
    });

    test('fromJson coerces non-bool / null values defensively', () {
      final chat = Chat.fromJson({
        'chatId': 'chat-1',
        'participants': ['me', 'other'],
        'lastMessageSent': Timestamp.fromDate(DateTime(2026)),
        'createdAt': Timestamp.fromDate(DateTime(2026)),
        'config': {'archived': [], 'favorite': []},
        'blocked': {'me': true, 'other': null},
      });

      expect(chat.isBlockedBy('me'), isTrue);
      expect(chat.isBlockedBy('other'), isFalse);
    });
  });
}
