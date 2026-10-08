import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sinergy_hub/features/chat/domain/models/chat/chat.dart';
import 'package:sinergy_hub/features/chat/domain/models/chat_config/chat_config.dart';
import 'package:sinergy_hub/features/chat/domain/usecases/listen_chats_use_case.dart';
import 'package:sinergy_hub/features/chat/presentation/bloc/chat_bloc/chat_bloc.dart';

class MockListenChatsUseCase extends Mock implements ListenChatsUseCase {}

void main() {
  late MockListenChatsUseCase mockListenChatsUseCase;

  setUp(() {
    mockListenChatsUseCase = MockListenChatsUseCase();
  });

  group('ChatBloc', () {
    final chat = Chat(
      lastMessageSent: DateTime.now(),
      participants: ['uid1', 'uid2'],
      createdAt: DateTime.now(),
      config: ChatConfig(),
    );

    blocTest<ChatBloc, ChatState>(
      'emits updated chats when stream returns data',
      setUp: () {
        when(() => mockListenChatsUseCase.call()).thenAnswer(
          (_) => Stream.value([chat]),
        );
      },
      build: () => ChatBloc(
        getChatsUseCase: mockListenChatsUseCase,
      ),
      act: (bloc) => bloc.add(const ChatEvent.init()),
      expect: () => [
        ChatState(
          chats: [chat],
          status: ChatStatus.initial,
        ),
      ],
    );
  });
}
