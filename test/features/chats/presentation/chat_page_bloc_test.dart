import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sinergy_hub/features/chat/domain/failures/chat_validation_failure.dart';
import 'package:sinergy_hub/features/chat/domain/failures/typing_status_failure.dart';
import 'package:sinergy_hub/features/chat/domain/models/chat/chat.dart';
import 'package:sinergy_hub/features/chat/domain/models/chat_config/chat_config.dart';
import 'package:sinergy_hub/features/chat/domain/models/chat_message/chat_message.dart';
import 'package:sinergy_hub/features/chat/domain/models/chat_page_data/chat_page_data.dart';
import 'package:sinergy_hub/features/chat/domain/usecases/get_last_messages_use_case.dart';
import 'package:sinergy_hub/features/chat/domain/usecases/listen_chat_by_id_use_case.dart';
import 'package:sinergy_hub/features/chat/domain/usecases/open_chat_use_case.dart';
import 'package:sinergy_hub/features/chat/domain/usecases/send_message_use_case.dart';
import 'package:sinergy_hub/features/chat/domain/usecases/update_typing_info_use_case.dart';
import 'package:sinergy_hub/features/chat/presentation/bloc/chat_page_bloc/chat_page_bloc.dart';
import 'package:sinergy_hub/features/user/domain/models/user_data/user_data.dart';
import 'package:sinergy_hub/features/user/domain/usecases/listen_user_data_use_case.dart';

class MockSendMessageUseCase extends Mock implements SendMessageUseCase {}

class MockListenLastMessagesUseCase extends Mock
    implements ListenLastMessagesUseCase {}

class MockListenChatByIdUseCase extends Mock implements ListenChatByIdUseCase {}

class MockUpdateTypingInfoUseCase extends Mock
    implements UpdateTypingInfoUseCase {}

class MockOpenChatUseCase extends Mock implements OpenChatUseCase {}

class MockListenUserDataUseCase extends Mock implements ListenUserDataUseCase {}

void main() {
  late MockSendMessageUseCase sendMessageUseCase;
  late MockListenLastMessagesUseCase listenLastMessagesUseCase;
  late MockListenChatByIdUseCase listenChatByIdUseCase;
  late MockUpdateTypingInfoUseCase updateTypingInfoUseCase;
  late MockOpenChatUseCase openChatUseCase;
  late MockListenUserDataUseCase listenUserDataUseCase;

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

  final chatPageData = ChatPageData(
    chat: chat,
    users: [currentUser, otherUser],
    currentUser: currentUser,
    peerUid: otherUid,
  );

  ChatPageBloc buildBloc() => ChatPageBloc(
    sendMessageUseCase: sendMessageUseCase,
    getLastMessageUseCase: listenLastMessagesUseCase,
    listenChatByIdUseCase: listenChatByIdUseCase,
    openChatUseCase: openChatUseCase,
    updateTypingInfoUseCase: updateTypingInfoUseCase,
    listenUserDataUseCase: listenUserDataUseCase,
  );

  setUp(() {
    sendMessageUseCase = MockSendMessageUseCase();
    listenLastMessagesUseCase = MockListenLastMessagesUseCase();
    listenChatByIdUseCase = MockListenChatByIdUseCase();
    updateTypingInfoUseCase = MockUpdateTypingInfoUseCase();
    openChatUseCase = MockOpenChatUseCase();
    listenUserDataUseCase = MockListenUserDataUseCase();

    messagesController = StreamController<List<ChatMessage>>.broadcast();
    chatController = StreamController<Chat>.broadcast();
    userDataController = StreamController<UserData?>.broadcast();

    when(
      () => openChatUseCase.call(chatId: any(named: 'chatId')),
    ).thenAnswer((_) async => Left(chatPageData));
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
    ).thenAnswer((_) async => Left(null));
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
      'emits failed state and skips subscriptions when use case returns ChatValidationFailure',
      () async {
        when(
          () => openChatUseCase.call(chatId: any(named: 'chatId')),
        ).thenAnswer(
          (_) async => Right(
            const ChatValidationFailure('no peer'),
          ),
        );

        final bloc = buildBloc();

        bloc.add(const ChatPageEvent.init(chatId: chatId));

        await Future.doWhile(() async {
          await Future<void>.delayed(Duration.zero);
          return bloc.state.status != ChatPageStatus.failed;
        }).timeout(const Duration(seconds: 2));

        expect(bloc.state.status, ChatPageStatus.failed);
        expect(bloc.state.errorMessage, 'no peer');
        expect(bloc.state.chat, isNull);
        expect(bloc.state.userData, isNull);
        expect(bloc.state.users, isEmpty);
        expect(messagesController.hasListener, isFalse);
        expect(chatController.hasListener, isFalse);
        expect(userDataController.hasListener, isFalse);

        await bloc.close();
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

  group('ChatPageBloc typing presence', () {
    test(
      'typing events do not flip status to sending/sent',
      () async {
        final bloc = buildBloc();

        bloc.add(const ChatPageEvent.init(chatId: chatId));
        await Future.doWhile(() async {
          await Future<void>.delayed(Duration.zero);
          return bloc.state.status != ChatPageStatus.initial;
        }).timeout(const Duration(seconds: 2));

        final statusesSeen = <ChatPageStatus>[];
        final sub = bloc.stream.listen((s) => statusesSeen.add(s.status));

        bloc.add(const ChatPageEvent.startTyping());
        bloc.add(const ChatPageEvent.endTyping());
        await Future<void>.delayed(const Duration(milliseconds: 50));

        expect(
          statusesSeen,
          isNot(contains(ChatPageStatus.sending)),
          reason: 'typing must not put chat into a loading/sending state',
        );
        expect(bloc.state.status, ChatPageStatus.initial);

        verify(
          () => updateTypingInfoUseCase.call(
            chatId: chatId,
            status: true,
          ),
        ).called(1);
        verify(
          () => updateTypingInfoUseCase.call(
            chatId: chatId,
            status: false,
          ),
        ).called(1);

        await sub.cancel();
        await bloc.close();
      },
    );

    test(
      'bloc.close() notifies firestore that the user stopped typing',
      () async {
        final bloc = buildBloc();

        bloc.add(const ChatPageEvent.init(chatId: chatId));
        await Future.doWhile(() async {
          await Future<void>.delayed(Duration.zero);
          return bloc.state.status != ChatPageStatus.initial;
        }).timeout(const Duration(seconds: 2));

        clearInteractions(updateTypingInfoUseCase);

        await bloc.close();

        verify(
          () => updateTypingInfoUseCase.call(
            chatId: chatId,
            status: false,
          ),
        ).called(1);
      },
    );

    test(
      'bloc.close() is safe when chat failed to load (no chat in state)',
      () async {
        when(
          () => openChatUseCase.call(chatId: any(named: 'chatId')),
        ).thenAnswer(
          (_) async => Right(
            const ChatValidationFailure('no peer'),
          ),
        );

        final bloc = buildBloc();
        bloc.add(const ChatPageEvent.init(chatId: chatId));
        await Future.doWhile(() async {
          await Future<void>.delayed(Duration.zero);
          return bloc.state.status != ChatPageStatus.failed;
        }).timeout(const Duration(seconds: 2));

        await bloc.close();

        verifyNever(
          () => updateTypingInfoUseCase.call(
            chatId: any(named: 'chatId'),
            status: any(named: 'status'),
          ),
        );
      },
    );

    test(
      'typing failure from use case does not change chat status',
      () async {
        final bloc = buildBloc();

        bloc.add(const ChatPageEvent.init(chatId: chatId));
        await Future.doWhile(() async {
          await Future<void>.delayed(Duration.zero);
          return bloc.state.status != ChatPageStatus.initial;
        }).timeout(const Duration(seconds: 2));

        when(
          () => updateTypingInfoUseCase.call(
            chatId: any(named: 'chatId'),
            status: any(named: 'status'),
          ),
        ).thenAnswer(
          (_) async => Right(
            const TypingStatusFailure(),
          ),
        );

        bloc.add(const ChatPageEvent.startTyping());
        await Future<void>.delayed(const Duration(milliseconds: 50));

        expect(bloc.state.status, ChatPageStatus.initial);
        expect(bloc.state.errorMessage, isEmpty);

        await bloc.close();
      },
    );
  });
}
