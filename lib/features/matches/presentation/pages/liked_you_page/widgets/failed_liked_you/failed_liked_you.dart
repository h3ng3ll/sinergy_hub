import 'package:flutter/material.dart';

import '../../../../../../../core/resources/colors/app_colors.dart';
import '../../../../../../../core/resources/text/app_text_theme.dart';
import '../../../../../../../core/resources/translations/app_localizations.dart';
import '../../../../../../../core/widgets/btn/translucent_btn.dart';
import '../../../../../../../core/widgets/padding/horizontal_padding.dart';

class FailedLikedYou extends StatelessWidget {
  final String errorMessage;
  final VoidCallback onRetry;

  const FailedLikedYou({
    super.key,
    required this.errorMessage,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = AppTextTheme.of(context);
    final l10n = AppLocalizations.of(context)!;

    return Center(
      child: HorizontalPadding(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 12.0,
          children: [
            Icon(
              Icons.error_outline,
              color: AppColors.heartRed.value,
              size: 48.0,
            ),
            Text(
              l10n.liked_you_failed_title,
              textAlign: TextAlign.center,
              style: textTheme.bold17,
            ),
            Text(
              errorMessage,
              textAlign: TextAlign.center,
              style: textTheme.regular14.copyWith(
                color: AppColors.greyLight.value,
              ),
            ),
            TranslucentBtn(
              onPressed: onRetry,
              text: l10n.liked_you_retry,
            ),
          ],
        ),
      ),
    );
  }
}
