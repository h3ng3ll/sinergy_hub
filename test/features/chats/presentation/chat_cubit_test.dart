import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sinergy_hub/features/chat/domain/models/chat/chat.dart';
import 'package:sinergy_hub/features/chat/domain/usecases/get_chats_use_case.dart';
import 'package:sinergy_hub/features/chat/domain/usecases/init_chat_use_case.dart';
import 'package:sinergy_hub/features/chat/presentation/bloc/chat_cubit/chat_cubit.dart';
import 'package:sinergy_hub/features/user/domain/models/user_data/user_data.dart';
import 'package:sinergy_hub/features/user/presentation/bloc/user_cubit/user_cubit.dart';

class MockUserCubit extends MockCubit<UserState> implements UserCubit {}

class MockInitChatUseCase extends Mock implements InitChatUseCase {}

class MockGetChatsUseCase extends Mock implements GetChatsUseCase {}

void main() {
  late final MockInitChatUseCase mockInitChatUseCase;
  late final MockGetChatsUseCase mockGetChatsUseCase;
  late final MockUserCubit mockUserCubit;

  setUpAll(() {
    mockInitChatUseCase = MockInitChatUseCase();
    mockGetChatsUseCase = MockGetChatsUseCase();
    mockUserCubit = MockUserCubit();
  });

  group(
    'ChatCubit',
    () {
      final chat = Chat(
        user: UserData.none(),
        lastMessageSent: DateTime.now(),
        participants: [
          'uid1',
          'uid2',
        ],
        createdAt: DateTime.now(),
      );

      blocTest(
        'When GetChatsUseCase streams updated data - state updating ',
        setUp: () {
          /// user must be authorized e.g. uid not null
          when(
            () => mockUserCubit.uid,
          ).thenReturn(
            'uid1',
          );

          when(
            () => mockGetChatsUseCase.call(
              any(),
            ),
          ).thenAnswer(
            (_) => Stream.value(
              [
                chat,
              ],
            ),
          );
        },
        build: () {
          final cubit = ChatCubit(
            getChatsUseCase: mockGetChatsUseCase,
            initChatUseCase: mockInitChatUseCase,
            userCubit: mockUserCubit,
          );
          cubit.init();

          return cubit;
        },
        act:
            (
              cubit,
            ) => cubit.init(),
        expect: () => [
          ChatState(
            chats: [
              chat,
            ],
            status: ChatStatus.initial,
          ),
        ],
      );

      blocTest(
        'If catch exception return failed state',
        build: () => ChatCubit(
          getChatsUseCase: mockGetChatsUseCase,
          initChatUseCase: mockInitChatUseCase,
          userCubit: mockUserCubit,
        ),
        act: (cubit) => cubit.
      );
    },
  );
}
