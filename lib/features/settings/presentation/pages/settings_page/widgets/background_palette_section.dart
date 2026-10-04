import 'package:flutter/material.dart';

import '../../../../../../core/resources/colors/app_color_scheme.dart';
import '../../../../../../core/resources/text/app_text_theme.dart';
import '../../../../../../core/resources/translations/app_localizations.dart';
import '../../../../../../core/widgets/btn/translucent_btn.dart';
import 'palette_color_swatch.dart';

/// Premium background palette: the two shader colors and a Reset button.
class BackgroundPaletteSection extends StatelessWidget {
  final Color primary;
  final Color secondary;
  final bool isPremium;
  final VoidCallback onTapPrimary;
  final VoidCallback onTapSecondary;

  /// `null` disables Reset (nothing custom to reset).
  final VoidCallback? onReset;

  const BackgroundPaletteSection({
    super.key,
    required this.primary,
    required this.secondary,
    required this.isPremium,
    required this.onTapPrimary,
    required this.onTapSecondary,
    required this.onReset,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColorScheme.of(context);
    final textTheme = AppTextTheme.of(context);
    final l10n = AppLocalizations.of(context)!;

    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 15.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        spacing: 16.0,
        children: [
          Text(
            l10n.settings_background_title,
            style: textTheme.medium16.copyWith(
              color: colorScheme.onPrimary,
            ),
          ),
          if (!isPremium)
            Text(
              l10n.settings_background_premium_hint,
              style: textTheme.regular14.copyWith(
                color: colorScheme.onPrimary.withValues(alpha: 0.8),
              ),
            ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              PaletteColorSwatch(
                color: primary,
                label: l10n.settings_background_primary,
                onTap: onTapPrimary,
              ),
              PaletteColorSwatch(
                color: secondary,
                label: l10n.settings_background_secondary,
                onTap: onTapSecondary,
              ),
            ],
          ),
          SizedBox(
            width: double.infinity,
            child: TranslucentBtn(
              onPressed: onReset?.call,
              text: l10n.settings_background_reset,
            ),
          ),
        ],
      ),
    );
  }
}
