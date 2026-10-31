import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/di/injection.dart';
import '../../../../../core/resources/colors/app_colors.dart';
import '../../../../../core/resources/translations/app_localizations.dart';
import '../../../../../core/routes/init_router/init_router.dart';
import '../../../../../core/services/ui_message_service.dart';
import '../../../../../core/widgets/padding/horizontal_padding.dart';
import '../../../../home/presentation/home_bottom_bar/widgets/build_animated_background/build_animated_background.dart';
import '../../../domain/repositories/i_subscription_repository.dart';
import '../../../domain/usecases/get_plans_use_case.dart';
import '../../../domain/usecases/purchase_plan_use_case.dart';
import '../../../domain/usecases/restore_purchases_use_case.dart';
import '../../bloc/paywall_bloc/paywall_bloc.dart';
import 'widgets/paywall_footer.dart';
import 'widgets/paywall_hero.dart';
import 'widgets/paywall_plans_list.dart';
import 'widgets/premium_benefit_row.dart';

/// The Premium paywall page (`/premium`, deep-linkable). Opened when the
/// daily match limit is hit, from the Profile tab's "Upgrade to Premium",
/// from Settings and from Liked You — or directly by URL.
///
/// Pops with `true` when the user purchased or restored an active
/// subscription, `null` otherwise.
/// Readable width of the paywall content on wide screens; the gradient
/// background itself spans the whole window.
const double _kContentMaxWidth = 760.0;

/// Benefits switch to two columns at this content width.
const double _kTwoColumnBenefitsMinWidth = 560.0;

/// Gap between benefit tiles.
const double _kBenefitSpacing = 12.0;

class PaywallPage extends StatelessWidget {
  const PaywallPage({super.key});

  /// Opened by URL there is nothing to pop back to — fall back to Discovery.
  void _onClose(BuildContext context) {
    if (context.canPop()) {
      context.pop();
      return;
    }
    DiscoveryPageRoute().go(context);
  }

  void _onPurchased(BuildContext context) {
    if (context.canPop()) {
      context.pop(true);
      return;
    }
    DiscoveryPageRoute().go(context);
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
    TermsOfUsePageRoute().push(
      context,
    );
  }

  void _onPrivacyPolicy(BuildContext context) {
    PrivacyPolicyPageRoute().push(
      context,
    );
  }

  @override
  Widget build(BuildContext context) {
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
            _onPurchased(context);
          } else if (state.isNothingToRestore) {
            UiMessageService.showInfo(
              l10n.paywall_restore_nothing,
            );
          } else if (state.isFailed) {
            UiMessageService.showError(state.errorMessage);
          }
        },
        child: BuildAnimatedBackground(
          child: Scaffold(
            backgroundColor: AppColors.transparent.value,
            body: SafeArea(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: IconButton(
                        onPressed: () => _onClose(context),
                        tooltip: l10n.common_close,
                        icon: Icon(
                          Icons.close_rounded,
                          color: AppColors.white.value,
                          size: 28.0,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.only(
                        bottom: 32.0,
                      ),
                      child: Center(
                        child: ConstrainedBox(
                          constraints: const BoxConstraints(
                            maxWidth: _kContentMaxWidth,
                          ),
                          child: HorizontalPadding(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              spacing: 28.0,
                              children: [
                                const PaywallHero(),
                                LayoutBuilder(
                                  builder: (context, constraints) =>
                                      _buildBenefits(
                                        l10n,
                                        constraints.maxWidth,
                                      ),
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
                                    onPrivacyPolicy: () =>
                                        _onPrivacyPolicy(context),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Benefits as glass tiles: two columns when there is room, else one.
  Widget _buildBenefits(AppLocalizations l10n, double maxWidth) {
    final benefits = [
      PremiumBenefitRow(
        emoji: '❤️',
        text: l10n.paywall_benefit_unlimited_likes,
      ),
      PremiumBenefitRow(
        emoji: '💎',
        text: l10n.paywall_benefit_see_who_liked_you,
      ),
      PremiumBenefitRow(
        emoji: '🔓',
        text: l10n.paywall_benefit_unlock_content,
      ),
      PremiumBenefitRow(
        emoji: '🚀',
        text: l10n.paywall_benefit_more_visibility,
      ),
      PremiumBenefitRow(
        emoji: '⚡',
        text: l10n.paywall_benefit_unlimited_interactions,
      ),
      PremiumBenefitRow(
        emoji: '💬',
        text: l10n.paywall_benefit_exclusive_features,
      ),
    ];
    final columns = maxWidth >= _kTwoColumnBenefitsMinWidth ? 2 : 1;
    final tileWidth = (maxWidth - _kBenefitSpacing * (columns - 1)) / columns;

    return Wrap(
      spacing: _kBenefitSpacing,
      runSpacing: _kBenefitSpacing,
      children: [
        for (final benefit in benefits)
          SizedBox(
            width: tileWidth,
            child: benefit,
          ),
      ],
    );
  }
}
