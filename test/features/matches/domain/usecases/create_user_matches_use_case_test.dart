import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:sinergy_hub/core/services/firebase/firebase_functions_service.dart';
import 'package:sinergy_hub/features/matches/domain/usecases/create_user_matches_use_case.dart';
import 'package:sinergy_hub/features/matches/presentation/bloc/tinder_card_cubit/tinder_card_cubit.dart';
import 'package:sinergy_hub/features/matches/domain/exception/daily_match_limit_exceeded_exception.dart';
import 'package:sinergy_hub/features/matches/domain/exception/failed_matches_exception.dart';

class MockFirebaseFunctionsService extends Mock
    implements FirebaseFunctionsService {}

void main() {
  late MockFirebaseFunctionsService firebaseService;
  late CreateUserMatchesUseCase useCase;

  setUp(() {
    firebaseService = MockFirebaseFunctionsService();

    useCase = CreateUserMatchesUseCase(
      firebaseFunctionsService: firebaseService,
    );
  });

  const matchId = 'user_2';

  group('CreateUserMatchesUseCase', () {

    test('should call firebase function and return Left on success', () async {
      /// arrange
      when(() => firebaseService.call(
        functionName: any(named: 'functionName'),
        data: any(named: 'data'),
      )).thenAnswer((_) async {});

      /// act
      final result = await useCase.call(
        status: TinderCardStatus.liked,
        matchedID: matchId,
      );

      /// assert

      /// 1. firebase called
      verify(() => firebaseService.call(
        functionName: 'matchUser',
        data: {
          'matchId': matchId,
          'status': TinderCardStatus.liked.name,
        },
      )).called(1);

      /// 2. result is success
      expect(result, equals(const Left(null)));
    });

    test(
      'should return Right(DailyMatchLimitExceededException) when the '
      'function reports the daily limit as a normal MatchFailure payload',
      () async {
        /// arrange — the daily limit is returned as a normal value, not
        /// thrown: nothing is written server-side, so the like is not sent.
        when(() => firebaseService.call(
          functionName: any(named: 'functionName'),
          data: any(named: 'data'),
        )).thenAnswer(
          (_) async => {
            'success': false,
            'status': 'failed',
          },
        );

        /// act
        final result = await useCase.call(
          status: TinderCardStatus.liked,
          matchedID: matchId,
        );

        /// assert
        expect(result.isRight(), true);
        result.fold(
          (_) => fail('Expected Right'),
          (error) {
            expect(error, isA<DailyMatchLimitExceededException>());
          },
        );
      },
    );

    test('should return Right(Exception) when firebase throws', () async {
      /// arrange
      when(() => firebaseService.call(
        functionName: any(named: 'functionName'),
        data: any(named: 'data'),
      )).thenThrow(Exception('fail'));

      /// act
      final result = await useCase.call(
        status: TinderCardStatus.liked,
        matchedID: matchId,
      );

      /// assert

      expect(
        result.isRight(),
        true,
      );

      result.fold(
            (_) => fail('Expected Right'),
            (error) {
          expect(
            error,
            isA<NoFoundParticipantsInMatchesException>(),
          );
        },
      );
    });
  });
}