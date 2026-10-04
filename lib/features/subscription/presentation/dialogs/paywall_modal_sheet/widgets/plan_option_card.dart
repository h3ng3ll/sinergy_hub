import 'package:flutter/material.dart';

import '../../../../../../core/resources/colors/app_colors.dart';
import '../../../../../../core/resources/text/app_text_theme.dart';
import '../../../../../../core/resources/translations/app_localizations.dart';
import '../../../../domain/models/subscription_plan/subscription_plan.dart';

class PlanOptionCard extends StatelessWidget {
  final SubscriptionPlan plan;
  final bool isSelected;
  final bool isBestValue;
  final VoidCallback onTap;

  const PlanOptionCard({
    super.key,
    required this.plan,
    required this.isSelected,
    required this.isBestValue,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = AppTextTheme.of(context);
    final l10n = AppLocalizations.of(context)!;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16.0),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: AppColors.white.value,
          borderRadius: BorderRadius.circular(16.0),
          border: Border.all(
            color: isSelected
                ? AppColors.majorelleBlue.value
                : AppColors.antiFlashWhite.value,
            width: isSelected ? 2.0 : 1.0,
          ),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 4.0,
                    children: [
                      Wrap(
                        spacing: 8.0,
                        children: [
                          Text(
                            plan.title,
                            style: textTheme.medium16,
                          ),
                          if (isBestValue)
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8.0,
                                vertical: 2.0,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.majorelleBlue.value,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Text(
                                l10n.paywall_best_value,
                                style: textTheme.regular10.copyWith(
                                  color: AppColors.white.value,
                                ),
                              ),
                            ),
                        ],
                      ),
                      if (plan.introOffer != null)
                        Text(
                          plan.introOffer!,
                          style: textTheme.regular12,
                        ),
                    ],
                  ),
                ),
                Text(
                  plan.priceString,
                  style: textTheme.medium18,
                ),
              ],
            ),
            // Text(
            //   plan.description,
            //   style: textTheme.medium18,
            // ),
          ],
        ),
      ),
    );
  }
}
