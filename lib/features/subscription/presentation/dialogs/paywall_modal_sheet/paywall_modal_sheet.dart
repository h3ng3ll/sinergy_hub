import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/di/injection.dart';
import '../../../../../core/resources/colors/app_colors.dart';
import '../../../../../core/resources/translations/app_localizations.dart';
import '../../../../../core/routes/init_router/init_router.dart';
import '../../../../../core/services/ui_message_service.dart';
import '../../../domain/repositories/i_subscription_repository.dart';
import '../../../domain/usecases/get_plans_use_case.dart';
import '../../../domain/usecases/purchase_plan_use_case.dart';
import '../../../domain/usecases/restore_purchases_use_case.dart';
import '../../bloc/paywall_bloc/paywall_bloc.dart';
import 'widgets/paywall_footer.dart';
import 'widgets/paywall_header.dart';
import 'widgets/paywall_plans_list.dart';
import 'widgets/premium_benefit_row.dart';

/// The Premium paywall bottom sheet. Opened either when the daily match
/// limit is hit, or from the Profile tab's "Upgrade to Premium" action.
///
/// Returns `true` when the user purchased or restored an active
/// subscription during this presentation, `null`/`false` otherwise.
class PaywallModalSheet extends StatelessWidget {
  const PaywallModalSheet({super.key});

  static Future<bool?> show(BuildContext context) {
    return showModalBottomSheet<bool>(
      context: context,
      useRootNavigator: true,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => const PaywallModalSheet(),
    );
  }

  void _onClose(BuildContext context) {
    Navigator.pop(context);
  }

  void _onSelectPlan(BuildContext context, String planId) {
    context.read<PaywallBloc>().add(
      PaywallEvent.selectPlan(planId: planId),
    );
  }

  void _onContinue(BuildContext context) {
    context.read<PaywallBloc>().add(const PaywallEvent.purchase());
  }

  void _onRestore(BuildContext context) {
    context.read<PaywallBloc>().add(const PaywallEvent.restore());
  }

  void _onTermsOfUse(BuildContext context) {
    context.pop();
    TermsOfUsePageRoute().push(
      context,
    );
  }

  void _onPrivacyPolicy(BuildContext context) {
    context.pop();
    PrivacyPolicyPageRoute().push(
      context,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final sheetHeight = mediaQuery.size.height * 0.85;
    final l10n = AppLocalizations.of(context)!;

    return BlocProvider<PaywallBloc>(
      create: (_) => PaywallBloc(
        subscriptionRepository: getIt<ISubscriptionRepository>(),
        getPlansUseCase: getIt<GetPlansUseCase>(),
        purchasePlanUseCase: getIt<PurchasePlanUseCase>(),
        restorePurchasesUseCase: getIt<RestorePurchasesUseCase>(),
      )..add(const PaywallEvent.loadPlans()),
      child: BlocListener<PaywallBloc, PaywallState>(
        listenWhen: (p, c) => p.status != c.status,
        listener: (context, state) {
          if (state.isPurchased || state.isRestored) {
            UiMessageService.showSuccess(
              l10n.paywall_purchase_success,
            );
            Navigator.pop(context, true);
          } else if (state.isNothingToRestore) {
            UiMessageService.showInfo(
              l10n.paywall_restore_nothing,
            );
          } else if (state.isFailed) {
            UiMessageService.showError(state.errorMessage);
          }
        },
        child: Container(
          height: sheetHeight,
          decoration: BoxDecoration(
            color: AppColors.pinkLace.value,
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(20.0),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              PaywallHeader(
                onClose: () => _onClose(context),
              ),
              Flexible(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 20.0,
                    children: [
                      PremiumBenefitRow(
                        text: l10n.paywall_benefit_unlimited_likes,
                      ),
                      BlocBuilder<PaywallBloc, PaywallState>(
                        builder: (context, state) => PaywallPlansList(
                          state: state,
                          onSelectPlan: (planId) =>
                              _onSelectPlan(context, planId),
                        ),
                      ),
                      BlocBuilder<PaywallBloc, PaywallState>(
                        builder: (context, state) => PaywallFooter(
                          canContinue: state.selectedPlanId != null,
                          isBusy: state.isBusy,
                          onContinue: () => _onContinue(context),
                          onRestore: () => _onRestore(context),
                          onTermsOfUse: () => _onTermsOfUse(context),
                          onPrivacyPolicy: () => _onPrivacyPolicy(context),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
