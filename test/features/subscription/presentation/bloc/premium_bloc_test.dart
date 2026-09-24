import 'dart:async';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sinergy_hub/features/subscription/domain/models/premium_status/premium_status.dart';
import 'package:sinergy_hub/features/subscription/domain/usecases/identify_subscriber_use_case.dart';
import 'package:sinergy_hub/features/subscription/domain/usecases/watch_premium_status_use_case.dart';
import 'package:sinergy_hub/features/subscription/presentation/bloc/premium_bloc/premium_bloc.dart';

class _MockIdentifySubscriberUseCase extends Mock
    implements IdentifySubscriberUseCase {}

class _MockWatchPremiumStatusUseCase extends Mock
    implements WatchPremiumStatusUseCase {}

void main() {
  late _MockIdentifySubscriberUseCase identifySubscriberUseCase;
  late _MockWatchPremiumStatusUseCase watchPremiumStatusUseCase;

  setUp(() {
    identifySubscriberUseCase = _MockIdentifySubscriberUseCase();
    watchPremiumStatusUseCase = _MockWatchPremiumStatusUseCase();

    when(() => identifySubscriberUseCase.logIn(any())).thenAnswer(
      (_) async {},
    );
    when(() => identifySubscriberUseCase.logOut()).thenAnswer(
      (_) async {},
    );
  });

  PremiumBloc buildBloc() => PremiumBloc(
    identifySubscriberUseCase: identifySubscriberUseCase,
    watchPremiumStatusUseCase: watchPremiumStatusUseCase,
  );

  const uid = 'uid_1';

  group('PremiumBloc.init', () {
    blocTest<PremiumBloc, PremiumState>(
      'logs in the subscriber then follows the premium status stream',
      setUp: () {
        when(() => watchPremiumStatusUseCase.call(uid: uid)).thenAnswer(
          (_) => Stream.value(
            const PremiumStatus(isActive: true),
          ),
        );
      },
      build: buildBloc,
      act: (bloc) => bloc.add(const PremiumEvent.init(uid: uid)),
      expect: () => [
        isA<PremiumState>().having(
          (s) => s.status,
          'status',
          EPremiumStatus.loading,
        ),
        isA<PremiumState>()
            .having((s) => s.status, 'status', EPremiumStatus.ready)
            .having((s) => s.isPremium, 'isPremium', true),
      ],
      verify: (_) {
        verify(() => identifySubscriberUseCase.logIn(uid)).called(1);
      },
    );

    blocTest<PremiumBloc, PremiumState>(
      'a null premium status (no document) resolves to Free',
      setUp: () {
        when(() => watchPremiumStatusUseCase.call(uid: uid)).thenAnswer(
          (_) => Stream.value(null),
        );
      },
      build: buildBloc,
      act: (bloc) => bloc.add(const PremiumEvent.init(uid: uid)),
      expect: () => [
        isA<PremiumState>().having(
          (s) => s.status,
          'status',
          EPremiumStatus.loading,
        ),
        isA<PremiumState>()
            .having((s) => s.status, 'status', EPremiumStatus.ready)
            .having((s) => s.isPremium, 'isPremium', false),
      ],
    );

    blocTest<PremiumBloc, PremiumState>(
      'a stream error emits failed',
      setUp: () {
        when(() => watchPremiumStatusUseCase.call(uid: uid)).thenAnswer(
          (_) => Stream<PremiumStatus?>.error(Exception('boom')),
        );
      },
      build: buildBloc,
      act: (bloc) => bloc.add(const PremiumEvent.init(uid: uid)),
      expect: () => [
        isA<PremiumState>().having(
          (s) => s.status,
          'status',
          EPremiumStatus.loading,
        ),
        isA<PremiumState>().having(
          (s) => s.status,
          'status',
          EPremiumStatus.failed,
        ),
      ],
    );
  });

  group('PremiumBloc.reset', () {
    blocTest<PremiumBloc, PremiumState>(
      'logs out and resets to the initial state',
      build: buildBloc,
      seed: () => const PremiumState(
        status: EPremiumStatus.ready,
        isPremium: true,
      ),
      act: (bloc) => bloc.add(const PremiumEvent.reset()),
      expect: () => [const PremiumState()],
      verify: (_) {
        verify(() => identifySubscriberUseCase.logOut()).called(1);
      },
    );
  });

  group('PremiumBloc subscription lifecycle', () {
    blocTest<PremiumBloc, PremiumState>(
      'a repeated init for the same uid does not re-subscribe or re-login',
      setUp: () {
        when(() => watchPremiumStatusUseCase.call(uid: uid)).thenAnswer(
          (_) => Stream.value(const PremiumStatus(isActive: true)),
        );
      },
      build: buildBloc,
      act: (bloc) async {
        bloc.add(const PremiumEvent.init(uid: uid));
        await Future<void>.value();
        bloc.add(const PremiumEvent.init(uid: uid));
      },
      verify: (_) {
        verify(() => identifySubscriberUseCase.logIn(uid)).called(1);
        verify(() => watchPremiumStatusUseCase.call(uid: uid)).called(1);
      },
    );

    test('reset cancels the previous user\'s status subscription', () async {
      final controller = StreamController<PremiumStatus?>();
      when(() => watchPremiumStatusUseCase.call(uid: uid)).thenAnswer(
        (_) => controller.stream,
      );
      final bloc = buildBloc();

      bloc.add(const PremiumEvent.init(uid: uid));
      await Future<void>.delayed(Duration.zero);
      expect(controller.hasListener, isTrue);

      bloc.add(const PremiumEvent.reset());
      await Future<void>.delayed(Duration.zero);
      expect(controller.hasListener, isFalse);
      expect(bloc.state, const PremiumState());

      await bloc.close();
      await controller.close();
    });
  });
}
