import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sinergy_hub/features/chat/domain/models/chat/chat.dart';
import 'package:sinergy_hub/features/chat/domain/models/chat_config/chat_config.dart';
import 'package:sinergy_hub/features/chat/domain/models/chat_message/chat_message.dart';
import 'package:sinergy_hub/features/chat/domain/usecases/get_chat_by_id_use_case.dart';
import 'package:sinergy_hub/features/chat/domain/usecases/get_last_messages_use_case.dart';
import 'package:sinergy_hub/features/chat/domain/usecases/listen_chat_by_id_use_case.dart';
import 'package:sinergy_hub/features/chat/domain/usecases/send_message_use_case.dart';
import 'package:sinergy_hub/features/chat/domain/usecases/update_typing_info_use_case.dart';
import 'package:sinergy_hub/features/chat/presentation/bloc/chat_page_bloc/chat_page_bloc.dart';
import 'package:sinergy_hub/features/user/domain/models/user_data/user_data.dart';
import 'package:sinergy_hub/features/user/domain/usecases/get_current_user_data_use_case.dart';
import 'package:sinergy_hub/features/user/domain/usecases/get_users_use_case.dart';
import 'package:sinergy_hub/features/user/domain/usecases/listen_user_data_use_case.dart';

class MockSendMessageUseCase extends Mock implements SendMessageUseCase {}

class MockListenLastMessagesUseCase extends Mock
    implements ListenLastMessagesUseCase {}

class MockListenChatByIdUseCase extends Mock implements ListenChatByIdUseCase {}

class MockGetUsersUseCase extends Mock implements GetUsersUseCase {}

class MockUpdateTypingInfoUseCase extends Mock
    implements UpdateTypingInfoUseCase {}

class MockGetChatByIdUseCase extends Mock implements GetChatByIdUseCase {}

class MockListenUserDataUseCase extends Mock implements ListenUserDataUseCase {}

class MockGetCurrentUserDataUseCase extends Mock
    implements GetCurrentUserDataUseCase {}

void main() {
  late MockSendMessageUseCase sendMessageUseCase;
  late MockListenLastMessagesUseCase listenLastMessagesUseCase;
  late MockListenChatByIdUseCase listenChatByIdUseCase;
  late MockGetUsersUseCase getUsersUseCase;
  late MockUpdateTypingInfoUseCase updateTypingInfoUseCase;
  late MockGetChatByIdUseCase getChatByIdUseCase;
  late MockListenUserDataUseCase listenUserDataUseCase;
  late MockGetCurrentUserDataUseCase getCurrentUserDataUseCase;

  late StreamController<List<ChatMessage>> messagesController;
  late StreamController<Chat> chatController;
  late StreamController<UserData?> userDataController;

  const chatId = 'chat-1';
  const currentUid = 'me';
  const otherUid = 'other';

  final currentUser = UserData.none().copyWith(uid: currentUid);
  final otherUser = UserData.none().copyWith(uid: otherUid);

  final chat = Chat(
    chatId: chatId,
    participants: [currentUid, otherUid],
    lastMessageSent: DateTime(2026),
    createdAt: DateTime(2026),
    config: ChatConfig(),
  );

  ChatPageBloc buildBloc() => ChatPageBloc(
    sendMessageUseCase: sendMessageUseCase,
    getLastMessageUseCase: listenLastMessagesUseCase,
    listenChatByIdUseCase: listenChatByIdUseCase,
    getUsersUseCase: getUsersUseCase,
    updateTypingInfoUseCase: updateTypingInfoUseCase,
    getChatByIdUseCase: getChatByIdUseCase,
    listenUserDataUseCase: listenUserDataUseCase,
    getCurrentUserDataUseCase: getCurrentUserDataUseCase,
  );

  setUp(() {
    sendMessageUseCase = MockSendMessageUseCase();
    listenLastMessagesUseCase = MockListenLastMessagesUseCase();
    listenChatByIdUseCase = MockListenChatByIdUseCase();
    getUsersUseCase = MockGetUsersUseCase();
    updateTypingInfoUseCase = MockUpdateTypingInfoUseCase();
    getChatByIdUseCase = MockGetChatByIdUseCase();
    listenUserDataUseCase = MockListenUserDataUseCase();
    getCurrentUserDataUseCase = MockGetCurrentUserDataUseCase();

    messagesController = StreamController<List<ChatMessage>>.broadcast();
    chatController = StreamController<Chat>.broadcast();
    userDataController = StreamController<UserData?>.broadcast();

    when(
      () => getChatByIdUseCase.call(chatId: any(named: 'chatId')),
    ).thenAnswer((_) async => chat);
    when(
      () => getUsersUseCase.call(ids: any(named: 'ids')),
    ).thenAnswer((_) async => [currentUser, otherUser]);
    when(
      () => getCurrentUserDataUseCase.call(),
    ).thenAnswer((_) async => currentUser);
    when(
      () => listenLastMessagesUseCase.call(chatId: any(named: 'chatId')),
    ).thenAnswer((_) => messagesController.stream);
    when(
      () => listenChatByIdUseCase.call(chatId: any(named: 'chatId')),
    ).thenAnswer((_) => chatController.stream);
    when(
      () => listenUserDataUseCase.call(any()),
    ).thenAnswer((_) => userDataController.stream);
    when(
      () => updateTypingInfoUseCase.call(
        chatId: any(named: 'chatId'),
        status: any(named: 'status'),
      ),
    ).thenAnswer((_) async {});
  });

  tearDown(() async {
    if (!messagesController.isClosed) await messagesController.close();
    if (!chatController.isClosed) await chatController.close();
    if (!userDataController.isClosed) await userDataController.close();
  });

  group('ChatPageBloc subscription lifecycle', () {
    test(
      'cancels stream subscriptions after bloc.close()',
      () async {
        final bloc = buildBloc();

        bloc.add(const ChatPageEvent.init(chatId: chatId));

        // Wait for _init -> subscribe to register listeners on all streams.
        await Future.doWhile(() async {
          await Future<void>.delayed(Duration.zero);
          return !messagesController.hasListener ||
              !chatController.hasListener ||
              !userDataController.hasListener;
        }).timeout(const Duration(seconds: 2));

        expect(messagesController.hasListener, isTrue);
        expect(chatController.hasListener, isTrue);
        expect(userDataController.hasListener, isTrue);

        await bloc.close();

        expect(messagesController.hasListener, isFalse);
        expect(chatController.hasListener, isFalse);
        expect(userDataController.hasListener, isFalse);
      },
    );

    test(
      're-init cancels previous subscriptions before subscribing to the new chat',
      () async {
        final bloc = buildBloc();

        bloc.add(const ChatPageEvent.init(chatId: chatId));

        await Future.doWhile(() async {
          await Future<void>.delayed(Duration.zero);
          return !messagesController.hasListener;
        }).timeout(const Duration(seconds: 2));

        expect(messagesController.hasListener, isTrue);

        final newMessagesController =
            StreamController<List<ChatMessage>>.broadcast();
        final newChatController = StreamController<Chat>.broadcast();
        final newUserDataController = StreamController<UserData?>.broadcast();
        addTearDown(() async {
          if (!newMessagesController.isClosed) {
            await newMessagesController.close();
          }
          if (!newChatController.isClosed) await newChatController.close();
          if (!newUserDataController.isClosed) {
            await newUserDataController.close();
          }
        });

        when(
          () => listenLastMessagesUseCase.call(chatId: any(named: 'chatId')),
        ).thenAnswer((_) => newMessagesController.stream);
        when(
          () => listenChatByIdUseCase.call(chatId: any(named: 'chatId')),
        ).thenAnswer((_) => newChatController.stream);
        when(
          () => listenUserDataUseCase.call(any()),
        ).thenAnswer((_) => newUserDataController.stream);

        bloc.add(const ChatPageEvent.init(chatId: 'chat-2'));

        await Future.doWhile(() async {
          await Future<void>.delayed(Duration.zero);
          return !newMessagesController.hasListener;
        }).timeout(const Duration(seconds: 2));

        expect(messagesController.hasListener, isFalse);
        expect(chatController.hasListener, isFalse);
        expect(userDataController.hasListener, isFalse);

        expect(newMessagesController.hasListener, isTrue);
        expect(newChatController.hasListener, isTrue);
        expect(newUserDataController.hasListener, isTrue);

        await bloc.close();

        expect(newMessagesController.hasListener, isFalse);
        expect(newChatController.hasListener, isFalse);
        expect(newUserDataController.hasListener, isFalse);
      },
    );
  });
}
