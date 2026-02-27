import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sinergy_hub/features/chat/data/models/chat_dto/chat_dto.dart';
import 'package:sinergy_hub/features/chat/domain/models/chat/chat.dart';
import 'package:sinergy_hub/features/chat/domain/models/chat_info/chat_info.dart';
import 'package:sinergy_hub/features/chat/domain/models/chat_message/chat_message.dart';
import 'package:sinergy_hub/features/chat/domain/repositories/i_chat_message_repository.dart';
import 'package:sinergy_hub/features/chat/domain/repositories/i_chat_repository.dart';
import 'package:sinergy_hub/features/chat/domain/usecases/send_message_use_case.dart';
import 'package:sinergy_hub/features/onboard_survey/domain/models/specialization/specialization.dart';
import 'package:sinergy_hub/features/user/domain/models/user_data/user_data.dart';

import '../../../auth/data/repositories/auth_repository_mock.dart';

class ChatMessageRepositoryMock extends IChatMessageRepository with Mock {}

class ChatRepositoryMock extends IChatRepository with Mock {}

class MessageMock with Fake implements ChatMessage {}

class ChatMock with Fake implements Chat {}

class ChatDTOMock with Fake implements ChatDto {}

void main() {
  setUpAll(
    () {
      registerFallbackValue(
        ChatDto(
          lastMessageSent: DateTime.now(),
          participants: [],
          createdAt: DateTime.now(),
          info: ChatInfo(
            specialization: ESpecialization.backendDeveloper,
          ),
        ),
      );
    },
  );
  test(
    'If Called create message and update chat ',
    () async {
      /// arrange
      final chatMessageRepo = ChatMessageRepositoryMock();
      final chatRepo = ChatRepositoryMock();
      final authRepo = AuthRepositoryMock();

      final message = ChatMessage(
        id: 'msg1',
        message: 'Hello',
        sentUid: 'user1',
        createdAt: DateTime.now(),
      );
      final chat = Chat(
        chatId: 'chatId',
        lastMessage: '',
        lastMessageSent: DateTime.now(),
        typingUsers: [],
        participants: [],
        createdAt: DateTime.now(),
        icon: '',
        info: ChatInfo(
          specialization: ESpecialization.backendDeveloper,
        ),
      );

      final useCase = SendMessageUseCase(
        chatMessageRepository: chatMessageRepo,
        chatRepository: chatRepo,
        authRepository: authRepo,
      );

      when(
        () => authRepo.requireUserId(),
      ).thenAnswer(
        (_) async => '',
      );
      when(
        () => chatMessageRepo.create(
          chatId: 'chatId',
          message: message,
        ),
      ).thenAnswer((_) async {
        return message;
      });

      when(
        () => chatRepo.update(
          chat: any(
            named: 'chat',
            that: isA<ChatDto>(),
          ),
        ),
      ).thenAnswer(
        (_) async => chat,
      );

      /// act

      await useCase.call(
        message: 'message',
        chat: chat,
      );

      /// assert

      verify(
        () => chatMessageRepo.create(
          chatId: 'chatId',
          message: message,
        ),
      ).called(
        1,
      );
      verify(
        () => chatRepo.update(
          chat: any(
            named: 'chat',
            that: isA<ChatDto>(),
          ),
        ),
      ).called(
        1,
      );
    },
  );
}
