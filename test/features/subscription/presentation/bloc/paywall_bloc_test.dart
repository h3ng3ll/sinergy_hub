import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sinergy_hub/core/models/exceptions.dart';
import 'package:sinergy_hub/features/subscription/domain/failures/subscription_failures.dart';
import 'package:sinergy_hub/features/subscription/domain/models/subscription_plan/subscription_plan.dart';
import 'package:sinergy_hub/features/subscription/domain/repositories/i_subscription_repository.dart';
import 'package:sinergy_hub/features/subscription/domain/usecases/get_plans_use_case.dart';
import 'package:sinergy_hub/features/subscription/domain/usecases/purchase_plan_use_case.dart';
import 'package:sinergy_hub/features/subscription/domain/usecases/restore_purchases_use_case.dart';
import 'package:sinergy_hub/features/subscription/presentation/bloc/paywall_bloc/paywall_bloc.dart';

class _MockSubscriptionRepository extends Mock
    implements ISubscriptionRepository {}

class _MockGetPlansUseCase extends Mock implements GetPlansUseCase {}

class _MockPurchasePlanUseCase extends Mock implements PurchasePlanUseCase {}

class _MockRestorePurchasesUseCase extends Mock
    implements RestorePurchasesUseCase {}

void main() {
  late _MockSubscriptionRepository subscriptionRepository;
  late _MockGetPlansUseCase getPlansUseCase;
  late _MockPurchasePlanUseCase purchasePlanUseCase;
  late _MockRestorePurchasesUseCase restorePurchasesUseCase;

  const weeklyPlan = SubscriptionPlan(
    id: 'weekly',
    title: 'Weekly',
    priceString: r'$4.99',
    description: 'Billed every week',
    period: EPlanPeriod.weekly,
  );
  const annualPlan = SubscriptionPlan(
    id: 'annual',
    title: 'Annual',
    priceString: r'$39.99',
    description: 'Billed once a year',
    period: EPlanPeriod.annual,
  );

  setUp(() {
    subscriptionRepository = _MockSubscriptionRepository();
    getPlansUseCase = _MockGetPlansUseCase();
    purchasePlanUseCase = _MockPurchasePlanUseCase();
    restorePurchasesUseCase = _MockRestorePurchasesUseCase();

    when(() => subscriptionRepository.isAvailable).thenReturn(true);
  });

  PaywallBloc buildBloc() => PaywallBloc(
    subscriptionRepository: subscriptionRepository,
    getPlansUseCase: getPlansUseCase,
    purchasePlanUseCase: purchasePlanUseCase,
    restorePurchasesUseCase: restorePurchasesUseCase,
  );

  group('PaywallBloc.loadPlans', () {
    blocTest<PaywallBloc, PaywallState>(
      'selects the annual plan by default when plans load',
      setUp: () {
        when(() => getPlansUseCase.call()).thenAnswer(
          (_) async => const Left([weeklyPlan, annualPlan]),
        );
      },
      build: buildBloc,
      act: (bloc) => bloc.add(const PaywallEvent.loadPlans()),
      expect: () => [
        isA<PaywallState>().having(
          (s) => s.status,
          'status',
          EPaywallStatus.loading,
        ),
        isA<PaywallState>()
            .having((s) => s.status, 'status', EPaywallStatus.ready)
            .having((s) => s.selectedPlanId, 'selectedPlanId', 'annual'),
      ],
    );

    blocTest<PaywallBloc, PaywallState>(
      'falls back to the first plan when there is no annual plan',
      setUp: () {
        when(() => getPlansUseCase.call()).thenAnswer(
          (_) async => const Left([weeklyPlan]),
        );
      },
      build: buildBloc,
      act: (bloc) => bloc.add(const PaywallEvent.loadPlans()),
      expect: () => [
        isA<PaywallState>().having(
          (s) => s.status,
          'status',
          EPaywallStatus.loading,
        ),
        isA<PaywallState>()
            .having((s) => s.status, 'status', EPaywallStatus.ready)
            .having((s) => s.selectedPlanId, 'selectedPlanId', 'weekly'),
      ],
    );

    blocTest<PaywallBloc, PaywallState>(
      'emits empty when no plans are returned',
      setUp: () {
        when(() => getPlansUseCase.call()).thenAnswer(
          (_) async => const Left(<SubscriptionPlan>[]),
        );
      },
      build: buildBloc,
      act: (bloc) => bloc.add(const PaywallEvent.loadPlans()),
      expect: () => [
        isA<PaywallState>().having(
          (s) => s.status,
          'status',
          EPaywallStatus.loading,
        ),
        isA<PaywallState>().having(
          (s) => s.status,
          'status',
          EPaywallStatus.empty,
        ),
      ],
    );

    blocTest<PaywallBloc, PaywallState>(
      'emits unavailable without calling the use case when repository is unavailable',
      setUp: () {
        when(() => subscriptionRepository.isAvailable).thenReturn(false);
      },
      build: buildBloc,
      act: (bloc) => bloc.add(const PaywallEvent.loadPlans()),
      expect: () => [
        isA<PaywallState>().having(
          (s) => s.status,
          'status',
          EPaywallStatus.unavailable,
        ),
      ],
      verify: (_) {
        verifyNever(() => getPlansUseCase.call());
      },
    );
  });

  group('PaywallBloc.purchase', () {
    blocTest<PaywallBloc, PaywallState>(
      'purchase succeeds',
      setUp: () {
        when(() => purchasePlanUseCase.call(planId: 'annual')).thenAnswer(
          (_) async => const Left(EPurchaseOutcome.purchased),
        );
      },
      build: buildBloc,
      seed: () => const PaywallState(
        status: EPaywallStatus.ready,
        plans: [annualPlan],
        selectedPlanId: 'annual',
      ),
      act: (bloc) => bloc.add(const PaywallEvent.purchase()),
      expect: () => [
        isA<PaywallState>().having(
          (s) => s.status,
          'status',
          EPaywallStatus.purchasing,
        ),
        isA<PaywallState>().having(
          (s) => s.status,
          'status',
          EPaywallStatus.purchased,
        ),
      ],
    );

    blocTest<PaywallBloc, PaywallState>(
      'purchase cancelled by the user',
      setUp: () {
        when(() => purchasePlanUseCase.call(planId: 'annual')).thenAnswer(
          (_) async => const Left(EPurchaseOutcome.cancelled),
        );
      },
      build: buildBloc,
      seed: () => const PaywallState(
        status: EPaywallStatus.ready,
        plans: [annualPlan],
        selectedPlanId: 'annual',
      ),
      act: (bloc) => bloc.add(const PaywallEvent.purchase()),
      expect: () => [
        isA<PaywallState>().having(
          (s) => s.status,
          'status',
          EPaywallStatus.purchasing,
        ),
        isA<PaywallState>().having(
          (s) => s.status,
          'status',
          EPaywallStatus.cancelled,
        ),
      ],
    );

    blocTest<PaywallBloc, PaywallState>(
      'purchase fails',
      setUp: () {
        when(() => purchasePlanUseCase.call(planId: 'annual')).thenAnswer(
          (_) async => Right<EPurchaseOutcome, Exceptions>(
            PurchaseFailedFailure('store error'),
          ),
        );
      },
      build: buildBloc,
      seed: () => const PaywallState(
        status: EPaywallStatus.ready,
        plans: [annualPlan],
        selectedPlanId: 'annual',
      ),
      act: (bloc) => bloc.add(const PaywallEvent.purchase()),
      expect: () => [
        isA<PaywallState>().having(
          (s) => s.status,
          'status',
          EPaywallStatus.purchasing,
        ),
        isA<PaywallState>()
            .having((s) => s.status, 'status', EPaywallStatus.failed)
            .having((s) => s.errorMessage, 'errorMessage', isNotEmpty),
      ],
    );

    blocTest<PaywallBloc, PaywallState>(
      'a second purchase tap while busy is ignored',
      setUp: () {
        when(() => purchasePlanUseCase.call(planId: 'annual')).thenAnswer(
          (_) async => const Left(EPurchaseOutcome.purchased),
        );
      },
      build: buildBloc,
      seed: () => const PaywallState(
        status: EPaywallStatus.purchasing,
        plans: [annualPlan],
        selectedPlanId: 'annual',
      ),
      act: (bloc) => bloc.add(const PaywallEvent.purchase()),
      expect: () => [],
      verify: (_) {
        verifyNever(() => purchasePlanUseCase.call(planId: any(named: 'planId')));
      },
    );
  });

  group('PaywallBloc.restore', () {
    blocTest<PaywallBloc, PaywallState>(
      'restore finds an active purchase',
      setUp: () {
        when(() => restorePurchasesUseCase.call()).thenAnswer(
          (_) async => const Left(ERestoreOutcome.restored),
        );
      },
      build: buildBloc,
      act: (bloc) => bloc.add(const PaywallEvent.restore()),
      expect: () => [
        isA<PaywallState>().having(
          (s) => s.status,
          'status',
          EPaywallStatus.restoring,
        ),
        isA<PaywallState>().having(
          (s) => s.status,
          'status',
          EPaywallStatus.restored,
        ),
      ],
    );

    blocTest<PaywallBloc, PaywallState>(
      'restore finds nothing to restore',
      setUp: () {
        when(() => restorePurchasesUseCase.call()).thenAnswer(
          (_) async => const Left(ERestoreOutcome.nothingToRestore),
        );
      },
      build: buildBloc,
      act: (bloc) => bloc.add(const PaywallEvent.restore()),
      expect: () => [
        isA<PaywallState>().having(
          (s) => s.status,
          'status',
          EPaywallStatus.restoring,
        ),
        isA<PaywallState>().having(
          (s) => s.status,
          'status',
          EPaywallStatus.nothingToRestore,
        ),
      ],
    );

    blocTest<PaywallBloc, PaywallState>(
      'restore fails',
      setUp: () {
        when(() => restorePurchasesUseCase.call()).thenAnswer(
          (_) async => Right<ERestoreOutcome, Exceptions>(
            RestoreFailedFailure('network error'),
          ),
        );
      },
      build: buildBloc,
      act: (bloc) => bloc.add(const PaywallEvent.restore()),
      expect: () => [
        isA<PaywallState>().having(
          (s) => s.status,
          'status',
          EPaywallStatus.restoring,
        ),
        isA<PaywallState>()
            .having((s) => s.status, 'status', EPaywallStatus.failed)
            .having((s) => s.errorMessage, 'errorMessage', isNotEmpty),
      ],
    );
  });
}
