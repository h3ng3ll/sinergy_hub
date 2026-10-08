import 'dart:async';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sinergy_hub/features/matches/domain/models/e_people_data_status.dart';
import 'package:sinergy_hub/features/matches/domain/models/matches_filter/matches_filter.dart';
import 'package:sinergy_hub/features/matches/domain/usecases/get_cached_discovery_deck_use_case.dart';
import 'package:sinergy_hub/features/matches/domain/usecases/look_for_matches_use_case.dart';
import 'package:sinergy_hub/features/matches/domain/usecases/remove_from_discovery_deck_use_case.dart';
import 'package:sinergy_hub/features/matches/domain/usecases/save_discovery_deck_use_case.dart';
import 'package:sinergy_hub/features/matches/presentation/bloc/people_data_bloc/people_data_bloc.dart';
import 'package:sinergy_hub/features/user/domain/models/user_data/user_data.dart';
import 'package:sinergy_hub/features/user/domain/models/users_data_pg_state/users_data_pg_state.dart';

class _MockLookForMatchesUseCase extends Mock
    implements LookForMatchesUseCase {}

class _MockGetCachedDiscoveryDeckUseCase extends Mock
    implements GetCachedDiscoveryDeckUseCase {}

class _MockSaveDiscoveryDeckUseCase extends Mock
    implements SaveDiscoveryDeckUseCase {}

class _MockRemoveFromDiscoveryDeckUseCase extends Mock
    implements RemoveFromDiscoveryDeckUseCase {}

void main() {
  late _MockLookForMatchesUseCase lookForMatchesUseCase;
  late _MockGetCachedDiscoveryDeckUseCase getCachedDiscoveryDeckUseCase;
  late _MockSaveDiscoveryDeckUseCase saveDiscoveryDeckUseCase;
  late _MockRemoveFromDiscoveryDeckUseCase removeFromDiscoveryDeckUseCase;

  setUpAll(() {
    registerFallbackValue(const UserDataPgState());
    registerFallbackValue(const MatchesFilter());
  });

  setUp(() {
    lookForMatchesUseCase = _MockLookForMatchesUseCase();
    getCachedDiscoveryDeckUseCase = _MockGetCachedDiscoveryDeckUseCase();
    saveDiscoveryDeckUseCase = _MockSaveDiscoveryDeckUseCase();
    removeFromDiscoveryDeckUseCase = _MockRemoveFromDiscoveryDeckUseCase();

    when(
      () => getCachedDiscoveryDeckUseCase.call(filter: any(named: 'filter')),
    ).thenAnswer((_) async => null);
    when(
      () => saveDiscoveryDeckUseCase.call(
        filter: any(named: 'filter'),
        deck: any(named: 'deck'),
      ),
    ).thenAnswer((_) async {});
    when(
      () => removeFromDiscoveryDeckUseCase.call(
        userUid: any(named: 'userUid'),
      ),
    ).thenAnswer((_) async {});
  });

  PeopleDataBloc buildBloc() => PeopleDataBloc(
    lookForMatchesUseCase: lookForMatchesUseCase,
    getCachedDiscoveryDeckUseCase: getCachedDiscoveryDeckUseCase,
    saveDiscoveryDeckUseCase: saveDiscoveryDeckUseCase,
    removeFromDiscoveryDeckUseCase: removeFromDiscoveryDeckUseCase,
  );

  final userA = UserData.none().copyWith(uid: 'A');
  final userB = UserData.none().copyWith(uid: 'B');
  final userC = UserData.none().copyWith(uid: 'C');

  PeopleDataState stateWithItems(List<UserData> items) => PeopleDataState(
    initialized: true,
    status: EPeopleDataStatus.initial,
    usersState: UserDataPgState(
      items: items,
      hasMore: false,
    ),
  );

  group('PeopleDataBloc.removeVisible + restoreVisible', () {
    blocTest<PeopleDataBloc, PeopleDataState>(
      'removeVisible then restoreVisible returns the user as the last (top) card',
      build: buildBloc,
      seed: () => stateWithItems([userA, userB, userC]),
      act: (bloc) async {
        bloc.add(const PeopleDataEvent.removeVisible());
        await Future<void>.delayed(Duration.zero);
        bloc.add(PeopleDataEvent.restoreVisible(user: userC));
      },
      verify: (bloc) {
        expect(
          bloc.state.usersState.items.map((u) => u.uid).toList(),
          ['A', 'B', 'C'],
        );
        expect(bloc.state.usersState.items.last.uid, 'C');
        verify(
          () => removeFromDiscoveryDeckUseCase.call(userUid: 'C'),
        ).called(1);
        verify(
          () => saveDiscoveryDeckUseCase.call(
            filter: any(named: 'filter'),
            deck: any(named: 'deck'),
          ),
        ).called(2);
      },
    );

    blocTest<PeopleDataBloc, PeopleDataState>(
      'restoreVisible is idempotent: calling twice with the same user does not duplicate',
      build: buildBloc,
      seed: () => stateWithItems([userA, userB]),
      act: (bloc) async {
        bloc.add(PeopleDataEvent.restoreVisible(user: userC));
        await Future<void>.delayed(Duration.zero);
        bloc.add(PeopleDataEvent.restoreVisible(user: userC));
      },
      verify: (bloc) {
        expect(
          bloc.state.usersState.items.map((u) => u.uid).toList(),
          ['A', 'B', 'C'],
        );
      },
    );

    blocTest<PeopleDataBloc, PeopleDataState>(
      'restoreVisible on an empty list appends the user as the only item',
      build: buildBloc,
      seed: () => stateWithItems(const []),
      act: (bloc) => bloc.add(
        PeopleDataEvent.restoreVisible(user: userA),
      ),
      verify: (bloc) {
        expect(
          bloc.state.usersState.items.map((u) => u.uid).toList(),
          ['A'],
        );
      },
    );

    /// Regression: when loadMorePeoples is in flight and restoreVisible
    /// inserts a user before the fetch returns, the fetch must NOT
    /// overwrite the restored user with its own (possibly empty) result.
    blocTest<PeopleDataBloc, PeopleDataState>(
      'loadMorePeoples merges fetched items with a user restored mid-flight (does not stomp restore)',
      setUp: () {
        final completer = Completer<UserDataPgState>();
        when(() => lookForMatchesUseCase.call(
          userDataState: any(named: 'userDataState'),
          filter: any(named: 'filter'),
        )).thenAnswer((_) => completer.future);

        /// Resolve the fetch with an empty list AFTER restoreVisible runs.
        Future<void>.delayed(const Duration(milliseconds: 20), () {
          completer.complete(
            const UserDataPgState(items: [], hasMore: false),
          );
        });
      },
      build: buildBloc,
      seed: () => PeopleDataState(
        initialized: true,
        status: EPeopleDataStatus.initial,
        usersState: const UserDataPgState(
          items: [],
          hasMore: true,
        ),
      ),
      act: (bloc) async {
        bloc.add(const PeopleDataEvent.loadMorePeoples());
        // restoreVisible fires while loadMorePeoples is awaiting
        await Future<void>.delayed(const Duration(milliseconds: 5));
        bloc.add(PeopleDataEvent.restoreVisible(user: userC));
        // wait long enough for the completer to resolve
        await Future<void>.delayed(const Duration(milliseconds: 50));
      },
      verify: (bloc) {
        expect(
          bloc.state.usersState.items.map((u) => u.uid).toList(),
          ['C'],
          reason:
              'loadMorePeoples must not overwrite the restored user with its empty fetch result',
        );
      },
    );
  });
  group('PeopleDataBloc.loadPeoples (cache-first deck)', () {
    blocTest<PeopleDataBloc, PeopleDataState>(
      'empty cache: fetches the deck and saves it to the cache',
      setUp: () {
        when(
          () => lookForMatchesUseCase.call(
            userDataState: any(named: 'userDataState'),
            filter: any(named: 'filter'),
          ),
        ).thenAnswer(
          (_) async => UserDataPgState(items: [userA, userB], hasMore: false),
        );
      },
      build: buildBloc,
      act: (bloc) => bloc.add(const PeopleDataEvent.loadPeoples()),
      verify: (bloc) {
        expect(bloc.state.initialized, isTrue);
        expect(bloc.state.status, EPeopleDataStatus.initial);
        expect(
          bloc.state.usersState.items.map((u) => u.uid).toList(),
          ['A', 'B'],
        );
        verify(
          () => getCachedDiscoveryDeckUseCase.call(
            filter: const MatchesFilter(),
          ),
        ).called(1);
        verify(
          () => lookForMatchesUseCase.call(
            userDataState: any(named: 'userDataState'),
            filter: any(named: 'filter'),
          ),
        ).called(1);
        final saved = verify(
          () => saveDiscoveryDeckUseCase.call(
            filter: const MatchesFilter(),
            deck: captureAny(named: 'deck'),
          ),
        ).captured;
        expect(saved, hasLength(1));
        expect(
          (saved.single as UserDataPgState).items.map((u) => u.uid).toList(),
          ['A', 'B'],
        );
      },
    );

    blocTest<PeopleDataBloc, PeopleDataState>(
      'cached deck: shown without a backend fetch or a cache write',
      setUp: () {
        when(
          () => getCachedDiscoveryDeckUseCase.call(
            filter: any(named: 'filter'),
          ),
        ).thenAnswer(
          (_) async => UserDataPgState(items: [userC], hasMore: true),
        );
      },
      build: buildBloc,
      act: (bloc) => bloc.add(const PeopleDataEvent.loadPeoples()),
      verify: (bloc) {
        expect(bloc.state.initialized, isTrue);
        expect(bloc.state.status, EPeopleDataStatus.initial);
        expect(
          bloc.state.usersState.items.map((u) => u.uid).toList(),
          ['C'],
        );
        verifyNever(
          () => lookForMatchesUseCase.call(
            userDataState: any(named: 'userDataState'),
            filter: any(named: 'filter'),
          ),
        );
        verifyNever(
          () => saveDiscoveryDeckUseCase.call(
            filter: any(named: 'filter'),
            deck: any(named: 'deck'),
          ),
        );
      },
    );

    blocTest<PeopleDataBloc, PeopleDataState>(
      'a failing cache read falls back to a fresh fetch',
      setUp: () {
        when(
          () => getCachedDiscoveryDeckUseCase.call(
            filter: any(named: 'filter'),
          ),
        ).thenThrow(StateError('corrupt cache'));
        when(
          () => lookForMatchesUseCase.call(
            userDataState: any(named: 'userDataState'),
            filter: any(named: 'filter'),
          ),
        ).thenAnswer(
          (_) async => UserDataPgState(items: [userA], hasMore: false),
        );
      },
      build: buildBloc,
      act: (bloc) => bloc.add(const PeopleDataEvent.loadPeoples()),
      verify: (bloc) {
        expect(bloc.state.status, EPeopleDataStatus.initial);
        expect(
          bloc.state.usersState.items.map((u) => u.uid).toList(),
          ['A'],
        );
      },
    );
  });
}
