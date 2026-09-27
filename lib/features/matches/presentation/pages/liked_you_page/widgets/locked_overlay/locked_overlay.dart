import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../../core/resources/colors/app_colors.dart';
import '../../../../../../../core/resources/text/app_text_theme.dart';
import '../../../../../../../core/resources/translations/app_localizations.dart';
import '../../../../../../../gen/assets.gen.dart';

class LockedOverlay extends StatelessWidget {
  const LockedOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = AppTextTheme.of(context);
    final l10n = AppLocalizations.of(context)!;

    return Positioned.fill(
      child: Container(
        color: AppColors.black.value.withValues(alpha: 0.45),
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            spacing: 12.0,
            children: [
              SvgPicture.asset(
                Assets.icons.crown,
                width: 36.0,
                height: 36.0,
              ),
              Text(
                l10n.liked_you_locked_message,
                textAlign: TextAlign.center,
                style: textTheme.semiBold17.copyWith(
                  color: AppColors.white.value,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
