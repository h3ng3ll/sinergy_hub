import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sinergy_hub/features/home/presentation/tabs/home_tab/bloc/tinder_card_cubit/tinder_card_cubit.dart';
import 'package:sinergy_hub/features/matches/data/models/user_match_dto/user_match_dto.dart';
import 'package:sinergy_hub/features/matches/domain/models/user_match/user_match.dart';
import 'package:sinergy_hub/features/matches/domain/repositories/i_user_matching_in_repository.dart';
import 'package:sinergy_hub/features/matches/domain/repositories/i_user_matching_out_repository.dart';
import 'package:sinergy_hub/features/matches/domain/usecases/create_user_matches_use_case.dart';
import 'package:sinergy_hub/features/user/domain/models/user_data/user_data.dart';

class MockUserMatchingInRepository extends Mock
    implements IUserMatchingInRepository {}

class MockUserMatchingOutRepository extends Mock
    implements IUserMatchingOutRepository {}

void main() {
  late CreateUserMatchesUseCase useCase;
  late MockUserMatchingInRepository mockInRepo;
  late MockUserMatchingOutRepository mockOutRepo;

  setUp(() {
    mockInRepo = MockUserMatchingInRepository();
    mockOutRepo = MockUserMatchingOutRepository();

    useCase = CreateUserMatchesUseCase(
      userMatchingOutRepository: mockOutRepo,
      userMatchingInRepository: mockInRepo,
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

class CreateUserMatchesUseCaseTest {}
