import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sinergy_hub/features/home/presentation/tabs/home_tab/bloc/tinder_card_cubit/tinder_card_cubit.dart';
import 'package:sinergy_hub/features/matches/domain/models/user_match/user_match.dart';
import 'package:sinergy_hub/features/matches/domain/usecases/create_user_matches_use_case.dart';
import 'package:sinergy_hub/features/notifications/domain/models/notification/notification.dart';
import 'package:sinergy_hub/features/user/domain/models/user_data/user_data.dart';

import '../../../notifications/data/repositories/notification_repository_mock.dart';
import '../../data/repositories/user_matching_in_repository_mock.dart';
import '../../data/repositories/user_matching_out_repository_mock.dart';

void main() {
  late CreateUserMatchesUseCase useCase;
  late UserMatchingInRepositoryMock mockInRepo;
  late UserMatchingOutRepositoryMock mockOutRepo;
  late NotificationRepositoryMock notificationRepository;

  setUp(() {
    mockInRepo = UserMatchingInRepositoryMock();
    mockOutRepo = UserMatchingOutRepositoryMock();
    notificationRepository = NotificationRepositoryMock();

    useCase = CreateUserMatchesUseCase(
      userMatchingOutRepository: mockOutRepo,
      userMatchingInRepository: mockInRepo,
      notificationRepository: notificationRepository,
    );
  });

  const tUid = 'user_1';

  final tMatch = UserMatch(
    user: UserData.none(),
    matchStatus: TinderCardStatus.liked,
    time: DateTime.now(),
    completeness: EUserMatchCompleteness.none,
  );

  test('returns none when matchStatus is not liked', () async {
    final match = tMatch.copyWith(
      matchStatus: TinderCardStatus.reject,
    );

    final notification = Notification(
      createdAt: DateTime.now(),
    );

    when(
      () => notificationRepository.create(
        notification: notification,
      ),
    ).thenAnswer(
      (_) async => notification,
    );

    when(
      () => mockOutRepo.create(
        uid: tUid,
        match: match,
      ),
    ).thenAnswer(
      (_) async => match,
    );

    final result = await useCase(
      uid: tUid,
      match: match,
    );
    expect(
      result,
      EUserMatchCompleteness.none,
    );
    verify(
      () => mockOutRepo.create(
        uid: tUid,
        match: match.copyWith(
          completeness: EUserMatchCompleteness.none,
        ),
      ),
    );
    verifyNever(
      () => mockInRepo.getById(
        uid: any(
          named: 'uid',
        ),
      ),
    );
  });
}
