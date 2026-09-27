import 'package:flutter/material.dart';

import '../../../../../../../core/resources/colors/app_colors.dart';
import '../../../../../../../core/resources/text/app_text_theme.dart';
import '../../../../../../../core/resources/translations/app_localizations.dart';
import '../../../../../../../core/widgets/custom_loading_indicator.dart';

class LoadMoreFooter extends StatelessWidget {
  final bool isFailed;
  final VoidCallback onRetry;

  const LoadMoreFooter({
    super.key,
    required this.isFailed,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    if (!isFailed) {
      return const Padding(
        padding: EdgeInsets.symmetric(vertical: 16.0),
        child: CustomLoadingIndicator(),
      );
    }

    final textTheme = AppTextTheme.of(context);
    final l10n = AppLocalizations.of(context)!;

    return Center(
      child: TextButton(
        onPressed: onRetry,
        child: Text(
          l10n.liked_you_load_more_failed,
          style: textTheme.regular14.copyWith(
            color: AppColors.heartRed.value,
          ),
        ),
      ),
    );
  }
}
