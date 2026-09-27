import 'package:flutter/material.dart';

import '../../../../../../core/resources/colors/app_colors.dart';
import '../../../../../../core/resources/text/app_text_theme.dart';
import '../../../../../../core/resources/translations/app_localizations.dart';
import '../../../../../../core/widgets/btn/app_btn.dart';
import '../../../../../../core/widgets/btn/custom_text_btn.dart';

class PaywallFooter extends StatelessWidget {
  final bool canContinue;
  final bool isBusy;
  final VoidCallback onContinue;
  final VoidCallback onRestore;
  final VoidCallback onTermsOfUse;
  final VoidCallback onPrivacyPolicy;

  const PaywallFooter({
    super.key,
    required this.canContinue,
    required this.isBusy,
    required this.onContinue,
    required this.onRestore,
    required this.onTermsOfUse,
    required this.onPrivacyPolicy,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final textTheme = AppTextTheme.of(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      spacing: 12.0,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            PrimaryBtn(
              onPressed: (isBusy || !canContinue) ? null : onContinue,
              text: l10n.paywall_continue,
            ),
            if (isBusy)
              const SizedBox(
                width: 20.0,
                height: 20.0,
                child: CircularProgressIndicator(
                  strokeWidth: 2.0,
                  color: Colors.white,
                ),
              ),
          ],
        ),
        CustomTextBtn(
          text: l10n.paywall_restore,
          onPressed: onRestore,
        ),
        Text(
          l10n.paywall_auto_renew_note,
          textAlign: TextAlign.center,
          style: textTheme.regular10.copyWith(
            color: AppColors.greyLight.value,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 16.0,
          children: [
            CustomTextBtn(
              text: l10n.terms_of_use,
              onPressed: onTermsOfUse,
            ),
            CustomTextBtn(
              text: l10n.privacy_policy,
              onPressed: onPrivacyPolicy,
            ),
          ],
        ),
      ],
    );
  }
}
