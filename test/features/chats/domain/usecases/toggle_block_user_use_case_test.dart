import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sinergy_hub/features/chat/domain/repositories/i_chat_repository.dart';
import 'package:sinergy_hub/features/chat/domain/usecases/toggle_block_user_use_case.dart';

class MockChatRepository extends Mock implements IChatRepository {}

void main() {
  late MockChatRepository chatRepo;
  late ToggleBlockUserUseCase useCase;

  const chatId = 'chat-1';
  const targetUid = 'peer';

  setUp(() {
    chatRepo = MockChatRepository();
    useCase = ToggleBlockUserUseCase(
      chatRepository: chatRepo,
    );
  });

  group('ToggleBlockUserUseCase', () {
    test('writes the TARGET (peer) uid block flag and returns Left on success',
        () async {
      when(
        () => chatRepo.setBlocked(
          uid: any(named: 'uid'),
          chatId: any(named: 'chatId'),
          blocked: any(named: 'blocked'),
        ),
      ).thenAnswer((_) async {});

      final res = await useCase.call(
        chatId: chatId,
        targetUid: targetUid,
        blocked: true,
      );

      expect(res.isLeft(), isTrue);
      verify(
        () => chatRepo.setBlocked(
          uid: targetUid,
          chatId: chatId,
          blocked: true,
        ),
      ).called(1);
    });

    test('passes blocked=false through when unblocking', () async {
      when(
        () => chatRepo.setBlocked(
          uid: any(named: 'uid'),
          chatId: any(named: 'chatId'),
          blocked: any(named: 'blocked'),
        ),
      ).thenAnswer((_) async {});

      await useCase.call(
        chatId: chatId,
        targetUid: targetUid,
        blocked: false,
      );

      verify(
        () => chatRepo.setBlocked(
          uid: targetUid,
          chatId: chatId,
          blocked: false,
        ),
      ).called(1);
    });

    test('returns Right(BlockUserFailure) when the repository throws',
        () async {
      when(
        () => chatRepo.setBlocked(
          uid: any(named: 'uid'),
          chatId: any(named: 'chatId'),
          blocked: any(named: 'blocked'),
        ),
      ).thenThrow(Exception('firestore down'));

      final res = await useCase.call(
        chatId: chatId,
        targetUid: targetUid,
        blocked: true,
      );

      expect(res.isRight(), isTrue);
    });
  });
}
