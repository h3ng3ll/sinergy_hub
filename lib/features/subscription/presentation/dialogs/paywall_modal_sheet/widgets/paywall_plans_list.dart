import 'package:flutter/material.dart';

import '../../../../../../core/resources/text/app_text_theme.dart';
import '../../../../../../core/resources/translations/app_localizations.dart';
import '../../../../domain/models/subscription_plan/subscription_plan.dart';
import '../../../bloc/paywall_bloc/paywall_bloc.dart';
import 'plan_option_card.dart';

/// Renders the sheet's plans area for every [PaywallState] status: a
/// spinner while loading, a message when empty/unavailable, and the cards
/// once ready.
class PaywallPlansList extends StatelessWidget {
  final PaywallState state;
  final ValueChanged<String> onSelectPlan;

  const PaywallPlansList({
    super.key,
    required this.state,
    required this.onSelectPlan,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final textTheme = AppTextTheme.of(context);

    if (state.isUnavailable) {
      return Center(
        child: Text(
          l10n.paywall_unavailable,
          textAlign: TextAlign.center,
          style: textTheme.regular14,
        ),
      );
    }

    if (state.isEmpty) {
      return Center(
        child: Text(
          l10n.paywall_no_plans,
          textAlign: TextAlign.center,
          style: textTheme.regular14,
        ),
      );
    }

    if (state.isReady ||
        state.isPurchasing ||
        state.isRestoring ||
        state.isFailed) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 12.0,
        children: [
          for (final plan in state.plans)
            PlanOptionCard(
              plan: plan,
              isSelected: plan.id == state.selectedPlanId,
              isBestValue: plan.period == EPlanPeriod.annual,
              onTap: () => onSelectPlan(plan.id),
            ),
        ],
      );
    }

    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
