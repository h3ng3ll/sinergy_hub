import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:sinergy_hub/features/auth/domain/repostories/i_auth_repository.dart';
import 'package:sinergy_hub/features/matches/domain/models/matches_filter/matches_filter.dart';
import 'package:sinergy_hub/features/matches/domain/repositories/i_candidate_distance_repository.dart';
import 'package:sinergy_hub/features/matches/domain/usecases/get_excluded_matches_use_case.dart';
import 'package:sinergy_hub/features/matches/domain/usecases/look_for_matches_use_case.dart';
import 'package:sinergy_hub/features/user/domain/models/user_data/user_data.dart';
import 'package:sinergy_hub/features/user/domain/models/users_data_pg_state/users_data_pg_state.dart';
import 'package:sinergy_hub/features/user/domain/repositories/i_user_read_repository.dart';

class _MockUserReadRepository extends Mock implements IUserReadRepository {}

class _MockAuthRepository extends Mock implements IAuthRepository {}

class _MockGetExcludedMatchesUseCase extends Mock
    implements GetExcludedMatchesUseCase {}

class _CandidateDistanceRepository extends Mock
    implements ICandidateDistanceRepository {}

void main() {
  late _MockUserReadRepository userReadRepository;
  late _MockAuthRepository authRepository;
  late _MockGetExcludedMatchesUseCase getExcludedMatchesUseCase;
  late LookForMatchesUseCase useCase;
  late _CandidateDistanceRepository candidateDistanceRepository;

  const currentUid = 'me';

  final active1 = UserData.none().copyWith(uid: 'A');
  final deleted = UserData.none().copyWith(uid: 'B', isDeleted: true);
  final active2 = UserData.none().copyWith(uid: 'C');

  setUpAll(() {
    registerFallbackValue(const UserDataPgState());
  });

  setUp(() {
    userReadRepository = _MockUserReadRepository();
    authRepository = _MockAuthRepository();
    getExcludedMatchesUseCase = _MockGetExcludedMatchesUseCase();
    candidateDistanceRepository  = _CandidateDistanceRepository();

    useCase = LookForMatchesUseCase(
      userReadRepository: userReadRepository,
      authRepository: authRepository,
      getExcludedMatchesUseCase: getExcludedMatchesUseCase,
      candidateDistanceRepository: candidateDistanceRepository,
    );

    when(() => authRepository.requireUserId()).thenAnswer((_) async => currentUid);
    when(
      () => candidateDistanceRepository.getDistances(
        uids: any(named: 'uids'),
      ),
    ).thenAnswer((_) async => <String, double?>{});
  });

  group('LookForMatchesUseCase', () {
    test('excludes users flagged isDeleted from the result', () async {
      when(() => getExcludedMatchesUseCase.call()).thenAnswer((_) async => []);
      when(
        () => userReadRepository.get(
          userDataState: any(named: 'userDataState'),
          filter: any(named: 'filter'),
        ),
      ).thenAnswer(
        (_) async => UserDataPgState(items: [active1, deleted, active2]),
      );

      final result = await useCase.call(userDataState: const UserDataPgState());

      final uids = result.items.map((u) => u.uid).toList();
      expect(uids, ['A', 'C']);
      expect(uids, isNot(contains('B')));
    });

    test('still excludes matched/self uids alongside deleted users', () async {
      // 'A' is an already-matched peer; 'B' is deleted; 'C' is a fresh candidate.
      when(() => getExcludedMatchesUseCase.call())
          .thenAnswer((_) async => ['A']);
      when(
        () => userReadRepository.get(
          userDataState: any(named: 'userDataState'),
          filter: any(named: 'filter'),
        ),
      ).thenAnswer(
        (_) async => UserDataPgState(items: [active1, deleted, active2]),
      );

      final result = await useCase.call(userDataState: const UserDataPgState());

      final uids = result.items.map((u) => u.uid).toList();
      expect(uids, ['C']);
    });

    test('keeps all active users when none are deleted or excluded', () async {
      when(() => getExcludedMatchesUseCase.call()).thenAnswer((_) async => []);
      when(
        () => userReadRepository.get(
          userDataState: any(named: 'userDataState'),
          filter: any(named: 'filter'),
        ),
      ).thenAnswer(
        (_) async => UserDataPgState(items: [active1, active2]),
      );

      final result = await useCase.call(
        userDataState: const UserDataPgState(),
        filter: const MatchesFilter(),
      );

      expect(result.items.map((u) => u.uid).toList(), ['A', 'C']);
    });
  });
  group('LookForMatchesUseCase distances', () {
    test(
      'fetches distances only for the surviving candidates and keeps known values',
      () async {
        when(() => getExcludedMatchesUseCase.call()).thenAnswer((_) async => []);
        when(
          () => userReadRepository.get(
            userDataState: any(named: 'userDataState'),
            filter: any(named: 'filter'),
          ),
        ).thenAnswer(
          (_) async => UserDataPgState(items: [active1, deleted, active2]),
        );
        when(
          () => candidateDistanceRepository.getDistances(
            uids: any(named: 'uids'),
          ),
        ).thenAnswer((_) async => <String, double?>{'A': 1.5, 'C': null});

        final result = await useCase.call(
          userDataState: const UserDataPgState(),
        );

        verify(
          () => candidateDistanceRepository.getDistances(uids: ['A', 'C']),
        ).called(1);
        expect(result.distancesKm, {'A': 1.5});
      },
    );
  });
}
