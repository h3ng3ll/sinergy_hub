import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../core/resources/colors/app_colors.dart';
import '../../../../../../core/resources/text/app_text_theme.dart';
import '../../../../../../core/resources/translations/app_localizations.dart';
import '../../../../../../gen/assets.gen.dart';

/// Paywall hero on the animated gradient: glowing crown badge and title.
class PaywallHero extends StatelessWidget {
  const PaywallHero({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = AppTextTheme.of(context);
    final l10n = AppLocalizations.of(context)!;
    final white = AppColors.white.value;

    return Column(
      mainAxisSize: MainAxisSize.min,
      spacing: 16.0,
      children: [
        Container(
          width: 88.0,
          height: 88.0,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: white.withValues(
              alpha: 0.18,
            ),
            border: Border.all(
              color: white.withValues(
                alpha: 0.35,
              ),
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.gold.value.withValues(
                  alpha: 0.35,
                ),
                blurRadius: 32.0,
              ),
            ],
          ),
          child: SvgPicture.asset(
            Assets.icons.crown,
            width: 44.0,
            height: 44.0,
          ),
        ),
        Text(
          l10n.paywall_title,
          textAlign: TextAlign.center,
          style: textTheme.bold32.copyWith(
            color: white,
          ),
        ),
      ],
    );
  }
}
