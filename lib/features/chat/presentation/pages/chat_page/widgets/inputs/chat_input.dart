import 'package:flutter/material.dart';

import '../../../../../../../core/resources/colors/app_color_scheme.dart';
import '../../../../../../../core/resources/colors/app_colors.dart';
import '../../../../../../../core/resources/text/app_text_theme.dart';
import '../../../../../../../core/resources/translations/app_localizations.dart';
import '../../../../../../../core/utils/responsive_helper.dart';
import '../../../../../../../core/widgets/custom_text_field.dart';

class ChatInput extends StatelessWidget {
  final TextEditingController textEditingController;

  /// True only when the OTHER party has blocked the current user — the
  /// blocker is never shown this restricted state for their own action.
  final bool isBlocked;

  const ChatInput({
    super.key,
    required this.textEditingController,
    this.isBlocked = false,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final colorScheme = AppColorScheme.of(context);
    final textTheme = AppTextTheme.of(context);

    if (isBlocked) {
      /// Restricted state: the field is read-only and shows the restriction
      /// message inside it (instead of the usual placeholder), in red.
      final restrictedBorder = OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.tartOrange.value,
          width: 0.5,
        ),
        borderRadius: BorderRadius.circular(12.0),
      );

      return CustomTextField(
        controller: textEditingController,
        readOnly: true,
        hintText: l10n.chat_blocked_message,
        maxLines: 1,
        minLines: 1,
        fillColor: AppColors.tartOrange.value.withValues(alpha: 0.08),
        enabledBorder: restrictedBorder,
        focusedBorder: restrictedBorder,
        border: restrictedBorder,
        hintStyle: textTheme.regular14.copyWith(
          color: AppColors.tartOrange.value,
        ),
      );
    }

    if (!ResponsiveHelper.isMobile(context)) {
      final pillBorder = OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(24.0),
      );

      return CustomTextField(
        controller: textEditingController,
        hintText: l10n.chat_message_hint,
        style: textTheme.regular14.copyWith(
          color: colorScheme.onSecondary,
        ),
        maxLines: 5,
        minLines: 1,
        fillColor: AppColors.antiFlashWhite.value,
        enabledBorder: pillBorder,
        focusedBorder: pillBorder,
        border: pillBorder,
        hintStyle: textTheme.regular14.copyWith(
          color: AppColors.darkBlueGray.value,
        ),
      );
    }

    return CustomTextField(
      controller: textEditingController,
      hintText: l10n.chat_message_hint,
      style: textTheme.regular14.copyWith(
        color: colorScheme.onSecondary,
      ),
      maxLines: 5,
      minLines: 1,
      hintStyle: textTheme.regular14.copyWith(
        color: AppColors.black.value.withValues(
          alpha: 0.4
        ),
      ),
    );
  }
}
