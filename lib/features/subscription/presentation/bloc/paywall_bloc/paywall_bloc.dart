import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/models/subscription_plan/subscription_plan.dart';
import '../../../domain/repositories/i_subscription_repository.dart';
import '../../../domain/usecases/get_plans_use_case.dart';
import '../../../domain/usecases/purchase_plan_use_case.dart';
import '../../../domain/usecases/restore_purchases_use_case.dart';

part 'paywall_event.dart';

part 'paywall_state.dart';

part 'paywall_state_ext.dart';

part 'paywall_bloc.freezed.dart';

/// Scoped to the paywall sheet — created fresh in
/// PaywallModalSheet.show()/build(), never a global singleton.
class PaywallBloc extends Bloc<PaywallEvent, PaywallState> {
  final ISubscriptionRepository _subscriptionRepository;
  final GetPlansUseCase _getPlansUseCase;
  final PurchasePlanUseCase _purchasePlanUseCase;
  final RestorePurchasesUseCase _restorePurchasesUseCase;

  PaywallBloc({
    required this._subscriptionRepository,
    required this._getPlansUseCase,
    required this._purchasePlanUseCase,
    required this._restorePurchasesUseCase,
  }) : super(const PaywallState()) {
    on<_LoadPlans>(_loadPlans);
    on<_SelectPlan>(_selectPlan);
    on<_Purchase>(_purchase);
    on<_Restore>(_restore);
  }

  Future<void> _loadPlans(
    _LoadPlans event,
    Emitter<PaywallState> emit,
  ) async {
    if (!_subscriptionRepository.isAvailable) {
      emit(
        state.copyWith(
          status: EPaywallStatus.unavailable,
        ),
      );
      return;
    }

    emit(
      state.copyWith(
        status: EPaywallStatus.loading,
      ),
    );

    final result = await _getPlansUseCase.call();

    result.fold(
      (plans) {
        if (plans.isEmpty) {
          emit(
            state.copyWith(
              status: EPaywallStatus.empty,
              plans: plans,
            ),
          );
          return;
        }
        final defaultPlan = plans.firstWhere(
          (plan) => plan.period == EPlanPeriod.annual,
          orElse: () => plans.first,
        );
        emit(
          state.copyWith(
            status: EPaywallStatus.ready,
            plans: plans,
            selectedPlanId: defaultPlan.id,
          ),
        );
      },
      (failure) => emit(
        state.copyWith(
          status: EPaywallStatus.failed,
          errorMessage: failure.message,
        ),
      ),
    );
  }

  void _selectPlan(
    _SelectPlan event,
    Emitter<PaywallState> emit,
  ) {
    if (state.isBusy) return;
    emit(
      state.copyWith(
        selectedPlanId: event.planId,
      ),
    );
  }

  Future<void> _purchase(
    _Purchase event,
    Emitter<PaywallState> emit,
  ) async {
    if (state.isBusy) return;
    final planId = state.selectedPlanId;
    if (planId == null) return;

    emit(
      state.copyWith(
        status: EPaywallStatus.purchasing,
      ),
    );

    final result = await _purchasePlanUseCase.call(planId: planId);

    result.fold(
      (outcome) => emit(
        state.copyWith(
          status: outcome == EPurchaseOutcome.purchased
              ? EPaywallStatus.purchased
              : EPaywallStatus.cancelled,
        ),
      ),
      (failure) => emit(
        state.copyWith(
          status: EPaywallStatus.failed,
          errorMessage: failure.message,
        ),
      ),
    );
  }

  Future<void> _restore(
    _Restore event,
    Emitter<PaywallState> emit,
  ) async {
    if (state.isBusy) return;

    emit(
      state.copyWith(
        status: EPaywallStatus.restoring,
      ),
    );

    final result = await _restorePurchasesUseCase.call();

    result.fold(
      (outcome) => emit(
        state.copyWith(
          status: outcome == ERestoreOutcome.restored
              ? EPaywallStatus.restored
              : EPaywallStatus.nothingToRestore,
        ),
      ),
      (failure) => emit(
        state.copyWith(
          status: EPaywallStatus.failed,
          errorMessage: failure.message,
        ),
      ),
    );
  }
}
