import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sinergy_hub/features/chat/domain/models/chat_config/chat_config.dart';

import 'package:sinergy_hub/features/chat/domain/models/chat_message/chat_message.dart';
import 'package:sinergy_hub/features/chat/domain/models/chat/chat.dart';

import 'package:sinergy_hub/features/chat/domain/repositories/i_chat_message_repository.dart';
import 'package:sinergy_hub/features/auth/domain/repostories/i_auth_repository.dart';

import 'package:sinergy_hub/features/chat/domain/usecases/send_message_use_case.dart';
import 'package:sinergy_hub/features/chat/domain/usecases/update_chat_info_use_case.dart';
import 'package:sinergy_hub/features/chat/domain/usecases/get_chat_by_id_use_case.dart';

class MockChatMessageRepository extends Mock
    implements IChatMessageRepository {}

class MockAuthRepository extends Mock implements IAuthRepository {}

class MockUpdateChatInfoUseCase extends Mock implements UpdateChatInfoUseCase {}

class MockGetChatByIdUseCase extends Mock implements GetChatByIdUseCase {}
class ChatMessageFake extends Fake implements ChatMessage {}
class ChatFake extends Fake implements Chat {}

void main() {
  late MockChatMessageRepository chatMessageRepo;
  late MockAuthRepository authRepo;
  late MockUpdateChatInfoUseCase updateChatInfoUseCase;
  late MockGetChatByIdUseCase getChatByIdUseCase;

  late SendMessageUseCase useCase;

  setUpAll(() {
    registerFallbackValue(ChatMessageFake());
    registerFallbackValue(ChatFake());
  });

  setUp(() {
    chatMessageRepo = MockChatMessageRepository();
    authRepo = MockAuthRepository();
    updateChatInfoUseCase = MockUpdateChatInfoUseCase();
    getChatByIdUseCase = MockGetChatByIdUseCase();

    useCase = SendMessageUseCase(
      chatMessageRepository: chatMessageRepo,
      authRepository: authRepo,
      updateChatInfoUseCase: updateChatInfoUseCase,
      getChatByIdUseCase: getChatByIdUseCase,
    );
  });

  group('SendMessageUseCase', () {
    const chatId = 'chatId';
    const uid = 'user1';
    const messageText = 'Hello';

    final chat = Chat(
      chatId: chatId,
      lastMessage: '',
      lastMessageSent: DateTime.now(),
      typingUsers: [],
      participants: [],
      createdAt: DateTime.now(),
      icon: '',
      config: ChatConfig(),
    );

    test('should create message and update chat info', () async {
      /// arrange
      when(() => authRepo.requireUserId()).thenAnswer((_) async => uid);

      when(
        () => chatMessageRepo.create(
          message: any(named: 'message'),
          chatId: any(named: 'chatId'),
        ),
      ).thenAnswer(
        (_) async => ChatMessage(
          message: messageText,
          sentUid: uid,
          createdAt: DateTime.now(),
        ),
      );

      when(
        () => getChatByIdUseCase.call(chatId: any(named: 'chatId')),
      ).thenAnswer((_) async => chat);

      when(
        () => updateChatInfoUseCase(
          chatId: any(named: 'chatId'),
            chat: any(named: 'chat', that: isA<Chat>())
        ),
      ).thenAnswer((_) async {});

      /// act
      await useCase.call(
        message: messageText,
        chatId: chatId,
      );

      /// assert

      /// 1. message created
      verify(
        () => chatMessageRepo.create(
          chatId: chatId,
          message: any(
            named: 'message',
            that: isA<ChatMessage>()
                .having((m) => m.message, 'message', messageText)
                .having((m) => m.sentUid, 'uid', uid),
          ),
        ),
      ).called(1);

      /// 2. chat fetched
      verify(
        () => getChatByIdUseCase.call(
          chatId: chatId,
        ),
      ).called(1);

      /// 3. chat updated
      verify(
        () => updateChatInfoUseCase(
          chatId: chatId,
          chat: any(
            named: 'chat',
            that: isA<Chat>().having(
              (c) => c.lastMessage,
              'lastMessage',
              messageText,
            ),
          ),
        ),
      ).called(1);
    });

    group('message normalisation', () {
      setUp(() {
        when(() => authRepo.requireUserId()).thenAnswer((_) async => uid);
        when(
          () => chatMessageRepo.create(
            message: any(named: 'message'),
            chatId: any(named: 'chatId'),
          ),
        ).thenAnswer((_) async => ChatMessage(
              message: '',
              sentUid: uid,
              createdAt: DateTime.now(),
            ));
        when(() => getChatByIdUseCase.call(chatId: any(named: 'chatId')))
            .thenAnswer((_) async => chat);
        when(
          () => updateChatInfoUseCase(
            chatId: any(named: 'chatId'),
            chat: any(named: 'chat', that: isA<Chat>()),
          ),
        ).thenAnswer((_) async {});
      });

      Future<ChatMessage> captureMessage(String input) async {
        await useCase.call(message: input, chatId: chatId);
        final captured = verify(
          () => chatMessageRepo.create(
            chatId: chatId,
            message: captureAny(named: 'message'),
          ),
        ).captured.last as ChatMessage;
        return captured;
      }

      Future<Chat> captureChat(String input) async {
        await useCase.call(message: input, chatId: chatId);
        final captured = verify(
          () => updateChatInfoUseCase(
            chatId: chatId,
            chat: captureAny(named: 'chat'),
          ),
        ).captured.last as Chat;
        return captured;
      }

      test('collapses 2+ consecutive blank lines into a single line break',
          () async {
        final captured = await captureMessage('a\n\n\nb\n\n\n\nc');
        expect(captured.message, 'a\nb\nc');
      });

      test('preserves intentional single line breaks', () async {
        final captured = await captureMessage('a\nb\nc');
        expect(captured.message, 'a\nb\nc');
      });

      test('strips leading and trailing whitespace', () async {
        final captured = await captureMessage('  \n hello \n  ');
        expect(captured.message, 'hello');
      });

      test(
        'handles whitespace-only lines between content (the screenshot bug)',
        () async {
          final captured = await captureMessage(
            'test daklsdf f d\n\n\nafds\n\nd\naf\ndsf\nsf\nsd\nf\n\n\n\ndfads',
          );
          expect(
            captured.message,
            'test daklsdf f d\nafds\nd\naf\ndsf\nsf\nsd\nf\ndfads',
          );
        },
      );

      test('handles \\r\\n (Windows) line endings', () async {
        final captured = await captureMessage('a\r\n\r\n\r\nb');
        expect(captured.message, 'a\nb');
      });

      test('returns MessageNotSentFailure for whitespace-only input',
          () async {
        final res = await useCase.call(message: '   \n\n  \t  ', chatId: chatId);

        expect(res.isRight(), isTrue);
        verifyNever(() => chatMessageRepo.create(
              message: any(named: 'message'),
              chatId: any(named: 'chatId'),
            ));
        verifyNever(() => updateChatInfoUseCase(
              chatId: any(named: 'chatId'),
              chat: any(named: 'chat'),
            ));
      });

      test('lastMessage on the Chat doc uses the normalised text', () async {
        final captured = await captureChat('  a\n\n\nb  ');
        expect(captured.lastMessage, 'a\nb');
      });
    });
  });
}
