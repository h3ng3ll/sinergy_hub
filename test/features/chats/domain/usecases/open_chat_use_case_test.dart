import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sinergy_hub/features/chat/domain/failures/chat_validation_failure.dart';
import 'package:sinergy_hub/features/chat/domain/models/chat/chat.dart';
import 'package:sinergy_hub/features/chat/domain/models/chat_config/chat_config.dart';
import 'package:sinergy_hub/features/chat/domain/models/chat_page_data/chat_page_data.dart';
import 'package:sinergy_hub/features/chat/domain/usecases/get_chat_by_id_use_case.dart';
import 'package:sinergy_hub/features/chat/domain/usecases/open_chat_use_case.dart';
import 'package:sinergy_hub/features/user/domain/models/user_data/user_data.dart';
import 'package:sinergy_hub/features/user/domain/usecases/get_current_user_data_use_case.dart';
import 'package:sinergy_hub/features/user/domain/usecases/get_users_use_case.dart';

class MockGetChatByIdUseCase extends Mock implements GetChatByIdUseCase {}

class MockGetUsersUseCase extends Mock implements GetUsersUseCase {}

class MockGetCurrentUserDataUseCase extends Mock
    implements GetCurrentUserDataUseCase {}

void main() {
  late MockGetChatByIdUseCase getChatByIdUseCase;
  late MockGetUsersUseCase getUsersUseCase;
  late MockGetCurrentUserDataUseCase getCurrentUserDataUseCase;
  late OpenChatUseCase useCase;

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

  setUp(() {
    getChatByIdUseCase = MockGetChatByIdUseCase();
    getUsersUseCase = MockGetUsersUseCase();
    getCurrentUserDataUseCase = MockGetCurrentUserDataUseCase();
    useCase = OpenChatUseCase(
      getChatByIdUseCase: getChatByIdUseCase,
      getUsersUseCase: getUsersUseCase,
      getCurrentUserDataUseCase: getCurrentUserDataUseCase,
    );
  });

  group('OpenChatUseCase', () {
    test(
      'returns Left(ChatPageData) when chat has a resolvable peer',
      () async {
        when(
          () => getChatByIdUseCase.call(
            chatId: any(named: 'chatId'),
            preferCache: any(named: 'preferCache'),
          ),
        ).thenAnswer((_) async => chat);
        when(
          () => getUsersUseCase.call(
            ids: any(named: 'ids'),
            preferCache: any(named: 'preferCache'),
          ),
        ).thenAnswer((_) async => [currentUser, otherUser]);
        when(
          () => getCurrentUserDataUseCase.call(
            preferCache: any(named: 'preferCache'),
          ),
        ).thenAnswer((_) async => currentUser);

        final result = await useCase.call(chatId: chatId);

        expect(result.isLeft(), isTrue);
        final data = result.fold(
          (l) => l,
          (_) => throw StateError('expected Left'),
        );
        expect(data, isA<ChatPageData>());
        expect(data.peerUid, otherUid);
        expect(data.chat, chat);
        expect(data.currentUser, currentUser);
        expect(data.users, [currentUser, otherUser]);

        verify(
          () => getChatByIdUseCase.call(chatId: chatId, preferCache: true),
        ).called(1);
        verify(
          () => getCurrentUserDataUseCase.call(preferCache: true),
        ).called(1);
        verify(
          () => getUsersUseCase.call(
            ids: [currentUid, otherUid],
            preferCache: true,
          ),
        ).called(1);
      },
    );

    test('returns ChatValidationFailure when chatId is empty', () async {
      final result = await useCase.call(chatId: '');

      expect(result.isRight(), isTrue);
      final failure = result.fold(
        (_) => throw StateError('expected Right'),
        (r) => r,
      );
      expect(failure, isA<ChatValidationFailure>());
      expect((failure).message, 'Chat id is empty');

      verifyNever(
        () => getChatByIdUseCase.call(
          chatId: any(named: 'chatId'),
          preferCache: any(named: 'preferCache'),
        ),
      );
      verifyNever(
        () => getUsersUseCase.call(
          ids: any(named: 'ids'),
          preferCache: any(named: 'preferCache'),
        ),
      );
      verifyNever(
        () => getCurrentUserDataUseCase.call(
          preferCache: any(named: 'preferCache'),
        ),
      );
    });

    test(
      'returns ChatValidationFailure when chat has no resolvable peer',
      () async {
        when(
          () => getChatByIdUseCase.call(
            chatId: any(named: 'chatId'),
            preferCache: any(named: 'preferCache'),
          ),
        ).thenAnswer((_) async => chat);
        when(
          () => getUsersUseCase.call(
            ids: any(named: 'ids'),
            preferCache: any(named: 'preferCache'),
          ),
        ).thenAnswer((_) async => <UserData>[]);
        when(
          () => getCurrentUserDataUseCase.call(
            preferCache: any(named: 'preferCache'),
          ),
        ).thenAnswer((_) async => currentUser);

        final result = await useCase.call(chatId: chatId);

        expect(result.isRight(), isTrue);
        final failure = result.fold(
          (_) => throw StateError('expected Right'),
          (r) => r,
        );
        expect(failure, isA<ChatValidationFailure>());
      },
    );
  });
}
