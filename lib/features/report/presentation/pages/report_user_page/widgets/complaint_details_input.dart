import 'package:flutter/material.dart';

import '../../../../../../core/resources/colors/app_color_scheme.dart';
import '../../../../../../core/resources/colors/app_colors.dart';
import '../../../../../../core/resources/text/app_text_theme.dart';
import '../../../../../../core/resources/translations/app_localizations.dart';
import '../../../../../../core/widgets/custom_text_field.dart';
import 'field_label.dart';

class ComplaintDetailsInput extends StatelessWidget {
  final TextEditingController controller;

  const ComplaintDetailsInput({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final colorScheme = AppColorScheme.of(context);
    final textTheme = AppTextTheme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FieldLabel(text: l10n.report_user_details_label),
        CustomTextField(
          controller: controller,
          hintText: l10n.report_user_details_hint,
          maxLines: 6,
          minLines: 4,
          maxLength: 500,
          style: textTheme.regular14.copyWith(
            color: colorScheme.onPrimary,
          ),
          hintStyle: textTheme.regular14.copyWith(
            color: AppColors.white.value.withValues(alpha: 0.6),
          ),
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return l10n.report_user_details_required;
            }
            return null;
          },
        ),
      ],
    );
  }
}
