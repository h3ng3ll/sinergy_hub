import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sinergy_hub/core/models/exceptions.dart';
import 'package:sinergy_hub/features/matches/domain/exception/failed_matches_exception.dart';
import 'package:sinergy_hub/features/matches/domain/models/user_match/matches.dart';
import 'package:sinergy_hub/features/matches/domain/usecases/create_user_matches_use_case.dart';
import 'package:sinergy_hub/features/matches/domain/usecases/listen_two_way_match_use_case.dart';
import 'package:sinergy_hub/features/matches/presentation/bloc/matches_bloc/matches_bloc.dart';
import 'package:sinergy_hub/features/matches/presentation/bloc/tinder_card_cubit/tinder_card_cubit.dart';
import 'package:sinergy_hub/features/user/domain/models/user_data/user_data.dart';

class _MockCreateUserMatchesUseCase extends Mock
    implements CreateUserMatchesUseCase {}

class _MockListenTwoWayMatchUseCase extends Mock
    implements ListenTwoWayMatchUseCase {}

void main() {
  late _MockCreateUserMatchesUseCase createUseCase;
  late _MockListenTwoWayMatchUseCase listenUseCase;

  setUpAll(() {
    registerFallbackValue(TinderCardStatus.liked);
  });

  setUp(() {
    createUseCase = _MockCreateUserMatchesUseCase();
    listenUseCase = _MockListenTwoWayMatchUseCase();

    when(() => listenUseCase.call()).thenAnswer(
      (_) => const Stream<Matches?>.empty(),
    );
  });

  MatchesBloc buildBloc() => MatchesBloc(
    listenTwoWayMatchUseCase: listenUseCase,
    createUserMatchesUseCase: createUseCase,
  );

  final swipedUser = UserData.none().copyWith(
    uid: 'swiped_uid',
  );

  group('MatchesBloc.create', () {
    blocTest<MatchesBloc, MatchesState>(
      'on success: emits initial status and clears lastFailedUser',
      setUp: () {
        when(() => createUseCase.call(
          status: any(named: 'status'),
          matchedID: any(named: 'matchedID'),
        )).thenAnswer((_) async => const Left(null));
      },
      build: buildBloc,
      seed: () => MatchesState(
        status: MatchesStatus.failed,
        errorMessage: 'previous error',
        lastFailedUser: swipedUser,
      ),
      act: (bloc) => bloc.add(
        MatchesEvent.create(
          status: TinderCardStatus.liked,
          user: swipedUser,
        ),
      ),
      expect: () => [
        MatchesState(
          status: MatchesStatus.loading,
          errorMessage: 'previous error',
          lastFailedUser: null,
        ),
        MatchesState(
          status: MatchesStatus.initial,
          errorMessage: 'previous error',
          lastFailedUser: null,
        ),
      ],
      verify: (_) {
        verify(() => createUseCase.call(
          status: TinderCardStatus.liked,
          matchedID: swipedUser.uid,
        )).called(1);
      },
    );

    blocTest<MatchesBloc, MatchesState>(
      'on failure: emits failed status with errorMessage AND lastFailedUser set to the attempted user',
      setUp: () {
        when(() => createUseCase.call(
          status: any(named: 'status'),
          matchedID: any(named: 'matchedID'),
        )).thenAnswer(
          (_) async => Right<void, Exceptions>(
            NoFoundParticipantsInMatchesException(),
          ),
        );
      },
      build: buildBloc,
      act: (bloc) => bloc.add(
        MatchesEvent.create(
          status: TinderCardStatus.liked,
          user: swipedUser,
        ),
      ),
      expect: () => [
        isA<MatchesState>()
            .having((s) => s.status, 'status', MatchesStatus.loading)
            .having((s) => s.lastFailedUser, 'lastFailedUser', isNull),
        isA<MatchesState>()
            .having((s) => s.status, 'status', MatchesStatus.failed)
            .having((s) => s.lastFailedUser, 'lastFailedUser', swipedUser)
            .having((s) => s.errorMessage, 'errorMessage', isNotEmpty),
      ],
    );

    blocTest<MatchesBloc, MatchesState>(
      'consecutive failures: each create emits loading then failed, so the listener observes every failure',
      setUp: () {
        when(() => createUseCase.call(
          status: any(named: 'status'),
          matchedID: any(named: 'matchedID'),
        )).thenAnswer(
          (_) async => Right<void, Exceptions>(
            NoFoundParticipantsInMatchesException(),
          ),
        );
      },
      build: buildBloc,
      act: (bloc) async {
        bloc.add(
          MatchesEvent.create(
            status: TinderCardStatus.liked,
            user: swipedUser,
          ),
        );
        await Future<void>.delayed(Duration.zero);
        bloc.add(
          MatchesEvent.create(
            status: TinderCardStatus.liked,
            user: swipedUser,
          ),
        );
      },
      expect: () => [
        isA<MatchesState>().having((s) => s.status, 'status', MatchesStatus.loading),
        isA<MatchesState>()
            .having((s) => s.status, 'status', MatchesStatus.failed)
            .having((s) => s.lastFailedUser, 'lastFailedUser', swipedUser),
        isA<MatchesState>()
            .having((s) => s.status, 'status', MatchesStatus.loading)
            .having((s) => s.lastFailedUser, 'lastFailedUser', isNull),
        isA<MatchesState>()
            .having((s) => s.status, 'status', MatchesStatus.failed)
            .having((s) => s.lastFailedUser, 'lastFailedUser', swipedUser),
      ],
    );

    blocTest<MatchesBloc, MatchesState>(
      'recovery: a subsequent successful create after a failure clears lastFailedUser',
      setUp: () {
        var callCount = 0;
        when(() => createUseCase.call(
          status: any(named: 'status'),
          matchedID: any(named: 'matchedID'),
        )).thenAnswer((_) async {
          callCount++;
          if (callCount == 1) {
            return Right<void, Exceptions>(
              NoFoundParticipantsInMatchesException(),
            );
          }
          return const Left(null);
        });
      },
      build: buildBloc,
      act: (bloc) async {
        bloc.add(
          MatchesEvent.create(
            status: TinderCardStatus.liked,
            user: swipedUser,
          ),
        );
        await Future<void>.delayed(Duration.zero);
        bloc.add(
          MatchesEvent.create(
            status: TinderCardStatus.liked,
            user: swipedUser,
          ),
        );
      },
      expect: () => [
        isA<MatchesState>().having((s) => s.status, 'status', MatchesStatus.loading),
        isA<MatchesState>()
            .having((s) => s.status, 'status', MatchesStatus.failed)
            .having((s) => s.lastFailedUser, 'lastFailedUser', swipedUser),
        isA<MatchesState>()
            .having((s) => s.status, 'status', MatchesStatus.loading)
            .having((s) => s.lastFailedUser, 'lastFailedUser', isNull),
        isA<MatchesState>()
            .having((s) => s.status, 'status', MatchesStatus.initial)
            .having((s) => s.lastFailedUser, 'lastFailedUser', isNull),
      ],
    );
  });
}
