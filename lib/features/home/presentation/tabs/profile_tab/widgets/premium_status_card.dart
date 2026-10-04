import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

import '../../../../../../core/resources/colors/app_colors.dart';
import '../../../../../../core/resources/text/app_text_theme.dart';
import '../../../../../../core/resources/translations/app_localizations.dart';
import '../../../../../../core/widgets/btn/translucent_btn.dart';
import '../../../../../../gen/assets.gen.dart';

/// Active Premium subscription: until when it is valid, whether it renews,
/// and a way to manage / cancel it in the store.
class PremiumStatusCard extends StatelessWidget {
  /// End of the current paid period, when known.
  final DateTime? expiresAt;
  final bool willRenew;
  final bool isOpeningManagement;
  final VoidCallback onManage;

  const PremiumStatusCard({
    super.key,
    required this.expiresAt,
    required this.willRenew,
    required this.isOpeningManagement,
    required this.onManage,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = AppTextTheme.of(context);
    final l10n = AppLocalizations.of(context)!;
    final white = AppColors.white.value;
    final expiresAt = this.expiresAt;

    final status = expiresAt == null
        ? l10n.premium_active_status
        : willRenew
        ? l10n.premium_renews_on(DateFormat.yMMMd().format(expiresAt.toLocal()))
        : l10n.premium_active_until(
            DateFormat.yMMMd().format(expiresAt.toLocal()),
          );

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.majorelleBlue.value,
            AppColors.telemagenta.value,
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.majorelleBlue.value.withValues(alpha: 0.35),
            blurRadius: 14.0,
            offset: const Offset(0.0, 6.0),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        spacing: 12.0,
        children: [
          Row(
            spacing: 12.0,
            children: [
              SvgPicture.asset(
                Assets.icons.crown,
                width: 28.0,
                height: 28.0,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  spacing: 2.0,
                  children: [
                    Text(
                      l10n.premium_card_title,
                      style: textTheme.semiBold20.copyWith(color: white),
                    ),
                    Text(
                      status,
                      style: textTheme.medium14.copyWith(color: white),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Text(
            l10n.premium_cancel_hint,
            style: textTheme.regular14.copyWith(
              color: white.withValues(alpha: 0.85),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: TranslucentBtn(
              onPressed: isOpeningManagement ? null : onManage,
              text: l10n.premium_manage,
            ),
          ),
        ],
      ),
    );
  }
}
