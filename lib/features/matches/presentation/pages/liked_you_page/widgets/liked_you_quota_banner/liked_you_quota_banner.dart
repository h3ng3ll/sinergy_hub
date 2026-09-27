import 'package:flutter/material.dart';

import '../../../../../../../core/resources/colors/app_colors.dart';
import '../../../../../../../core/resources/text/app_text_theme.dart';
import '../../../../../../../core/resources/translations/app_localizations.dart';
import '../../../../../../../core/widgets/btn/action_btn.dart';
import '../../../../../domain/models/liked_you/liked_you_quota.dart';

class LikedYouQuotaBanner extends StatelessWidget {
  final LikedYouQuota quota;
  final VoidCallback onUpgrade;

  const LikedYouQuotaBanner({
    super.key,
    required this.quota,
    required this.onUpgrade,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = AppTextTheme.of(context);
    final l10n = AppLocalizations.of(context)!;

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 12.0,
      ),
      decoration: BoxDecoration(
        color: AppColors.white.value.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Row(
        spacing: 12.0,
        children: [
          Expanded(
            child: Text(
              l10n.liked_you_quota_banner(
                quota.remaining,
                quota.limit,
                _resetLabel(quota.resetsAt),
              ),
              style: textTheme.regular14.copyWith(
                color: AppColors.white.value,
              ),
            ),
          ),
          ActionBtn.filled(
            onPressed: onUpgrade,
            text: l10n.premium_upgrade,
          ),
        ],
      ),
    );
  }
}

String _resetLabel(DateTime? resetsAt) {
  if (resetsAt == null) return '';
  final diff = resetsAt.difference(DateTime.now());
  if (diff.isNegative) return '';
  if (diff.inDays >= 1) return '${diff.inDays}d';
  if (diff.inHours >= 1) return '${diff.inHours}h';
  if (diff.inMinutes >= 1) return '${diff.inMinutes}m';
  return '1m';
}
