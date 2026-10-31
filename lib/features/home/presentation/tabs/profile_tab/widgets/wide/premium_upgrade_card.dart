import 'package:flutter/material.dart';

import '../../../../../../../core/resources/colors/app_colors.dart';
import '../../../../../../../core/resources/text/app_text_theme.dart';
import '../../../../../../../core/resources/translations/app_localizations.dart';
import '../../../../../../../core/widgets/btn/action_btn.dart';

/// One full sweep of the light band across the card.
const Duration _kShimmerPeriod = Duration(milliseconds: 3200);

/// Width of the light band as a fraction of the card width.
const double _kShimmerBandWidth = 0.35;

/// Gradient call-to-action card with a slow light sweep.
class PremiumUpgradeCard extends StatefulWidget {
  final VoidCallback onUpgrade;

  const PremiumUpgradeCard({
    super.key,
    required this.onUpgrade,
  });

  @override
  State<PremiumUpgradeCard> createState() => _PremiumUpgradeCardState();
}

class _PremiumUpgradeCardState extends State<PremiumUpgradeCard>
    with SingleTickerProviderStateMixin {
  late final AnimationController _shimmer;

  @override
  void initState() {
    super.initState();
    _shimmer = AnimationController(
      vsync: this,
      duration: _kShimmerPeriod,
    )..repeat();
  }

  @override
  void dispose() {
    _shimmer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = AppTextTheme.of(context);
    final lo = AppLocalizations.of(context)!;
    final white = AppColors.white.value;

    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          24.0,
        ),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.majorelleBlue.value,
            AppColors.darkOrchid.value,
            AppColors.telemagenta.value,
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.majorelleBlue.value.withValues(
              alpha: 0.35,
            ),
            blurRadius: 24.0,
            offset: const Offset(0.0, 10.0),
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: IgnorePointer(
              child: AnimatedBuilder(
                animation: _shimmer,
                builder: (context, child) => Align(
                  alignment: Alignment(
                    -2.0 + 4.0 * _shimmer.value,
                    0.0,
                  ),
                  child: child,
                ),
                child: FractionallySizedBox(
                  widthFactor: _kShimmerBandWidth,
                  heightFactor: 1.0,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          white.withValues(alpha: 0.0),
                          white.withValues(alpha: 0.18),
                          white.withValues(alpha: 0.0),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              spacing: 14.0,
              children: [
                Row(
                  spacing: 12.0,
                  children: [
                    Container(
                      width: 40.0,
                      height: 40.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: white.withValues(
                          alpha: 0.2,
                        ),
                      ),
                      child: Icon(
                        Icons.workspace_premium,
                        color: AppColors.gold.value,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        lo.paywall_title,
                        style: textTheme.bold20.copyWith(
                          color: white,
                        ),
                      ),
                    ),
                  ],
                ),
                Text(
                  '${lo.paywall_benefit_see_who_liked_you} · '
                  '${lo.paywall_benefit_unlimited_likes}',
                  style: textTheme.regular14.copyWith(
                    color: white.withValues(
                      alpha: 0.9,
                    ),
                  ),
                ),
                ActionBtn(
                  onPressed: widget.onUpgrade,
                  padding: const EdgeInsets.symmetric(
                    vertical: 14.0,
                    horizontal: 20.0,
                  ),
                  child: Text(
                    lo.premium_upgrade,
                    style: textTheme.bold15.copyWith(
                      color: AppColors.majorelleBlue.value,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
