// import 'package:flutter_test/flutter_test.dart';
// import 'package:mocktail/mocktail.dart';
// import 'package:sinergy_hub/features/chat/domain/models/chat/chat.dart';
// import 'package:sinergy_hub/features/matches/presentation/bloc/tinder_card_cubit/tinder_card_cubit.dart';
// import 'package:sinergy_hub/features/matches/domain/models/user_match/user_match.dart';
// import 'package:sinergy_hub/features/matches/domain/usecases/create_user_matches_use_case.dart';
// import 'package:sinergy_hub/features/notifications/domain/models/notification/notification.dart';
// import 'package:sinergy_hub/features/user/domain/models/user_data/user_data.dart';
//
// import '../../../auth/data/repositories/auth_repository_mock.dart';
// import '../../../chats/data/usecases/init_chat_use_case_mock.dart';
// import '../../../notifications/data/repositories/notification_repository_mock.dart';
// import '../../data/repositories/user_matching_in_repository_mock.dart';
// import '../../data/repositories/user_matching_out_repository_mock.dart';
// import 'get_a_user_match_income_use_case_mock.dart';
//
// void main() {
//   late CreateUserMatchesUseCase useCase;
//   late UserMatchingInRepositoryMock mockInRepo;
//   late UserMatchingOutRepositoryMock mockOutRepo;
//   late NotificationRepositoryMock notificationRepository;
//   late InitChatUseCaseMock initChatUseCaseMock;
//   late AuthRepositoryMock authRepositoryMock;
//   late GetAUserMatchIncomeUseCaseMock getAUserMatchIncomeUseCaseMock;
//
//   setUp(() {
//     mockInRepo = UserMatchingInRepositoryMock();
//     mockOutRepo = UserMatchingOutRepositoryMock();
//     notificationRepository = NotificationRepositoryMock();
//     initChatUseCaseMock = InitChatUseCaseMock();
//     authRepositoryMock = AuthRepositoryMock();
//     getAUserMatchIncomeUseCaseMock = GetAUserMatchIncomeUseCaseMock();
//
//     useCase = CreateUserMatchesUseCase(
//       userMatchingOutRepository: mockOutRepo,
//       userMatchingInRepository: mockInRepo,
//       notificationRepository: notificationRepository,
//       initChatUseCase: initChatUseCaseMock,
//       authRepository: authRepositoryMock,
//       getAUserMatchIncomeUseCase: getAUserMatchIncomeUseCaseMock,
//     );
//   });
//
//   const tUid = 'user_1';
//
//   final tMatch = UserMatch(
//     user: UserData.none(),
//     matchStatus: TinderCardStatus.liked,
//     time: DateTime.now(),
//     completeness: EUserMatchCompleteness.none,
//   );
//
//   test(
//     'returns none when matchStatus is not liked',
//     () async {
//       final match = tMatch.copyWith(
//         matchStatus: TinderCardStatus.reject,
//       );
//
//       final notification = Notification(
//         createdAt: DateTime.now(),
//       );
//       final chat = Chat.empty();
//
//       when(
//         () => authRepositoryMock.requireUserId(),
//       ).thenAnswer(
//         (_) async => tUid,
//       );
//       when(
//         () => initChatUseCaseMock.call(
//           participates: [],
//         ),
//       ).thenAnswer(
//         (_) async => chat,
//       );
//
//       when(
//         () => notificationRepository.create(
//           notification: notification,
//           uid: any(
//             named: 'uid',
//           ),
//         ),
//       ).thenAnswer(
//         (_) async => notification,
//       );
//
//       when(
//         () => mockOutRepo.create(
//           uid: tUid,
//           match: match,
//         ),
//       ).thenAnswer(
//         (_) async => match,
//       );
//
//       final result = await useCase(
//         match: match,
//       );
//       expect(
//         result,
//         EUserMatchCompleteness.none,
//       );
//       verify(
//         () => mockOutRepo.create(
//           uid: tUid,
//           match: match.copyWith(
//             completeness: EUserMatchCompleteness.none,
//           ),
//         ),
//       );
//       verifyNever(
//         () => mockInRepo.getById(
//           uid: any(
//             named: 'uid',
//           ),
//         ),
//       );
//     },
//   );
// }
