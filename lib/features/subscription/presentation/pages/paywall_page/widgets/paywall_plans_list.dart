import 'package:flutter/material.dart';

import '../../../../../../core/resources/colors/app_colors.dart';
import '../../../../../../core/resources/text/app_text_theme.dart';
import '../../../../../../core/resources/translations/app_localizations.dart';
import '../../../../../../core/widgets/custom_loading_indicator.dart';
import '../../../../domain/models/subscription_plan/subscription_plan.dart';
import '../../../bloc/paywall_bloc/paywall_bloc.dart';
import 'plan_option_card.dart';

/// Renders the sheet's plans area for every [PaywallState] status: a
/// spinner only while the plans themselves are loading, a message when
/// empty/unavailable, and otherwise the cards — which stay on screen through
/// purchasing, restoring, cancelled, failed and every other outcome.
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
          style: textTheme.medium15.copyWith(
            color: AppColors.white.value,
          ),
        ),
      );
    }

    if (state.isInitial) {
      return CustomLoadingIndicator();
    }

    if (state.plans.isEmpty) {
      return Center(
        child: Text(
          l10n.paywall_no_plans,
          textAlign: TextAlign.center,
          style: textTheme.medium15.copyWith(
            color: AppColors.white.value,
          ),
        ),
      );
    }

    return Stack(
      children: [
        Column(
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
        ),
        if (state.isLoading) CustomLoadingIndicator(),
      ],
    );
  }
}
