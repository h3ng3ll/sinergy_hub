import 'package:flutter/material.dart';

import '../../../../../../core/resources/colors/app_color_scheme.dart';
import '../../../../../../core/resources/colors/app_colors.dart';
import '../../../../../../core/resources/text/app_text_theme.dart';
import '../../../../../../core/resources/translations/app_localizations.dart';
import 'field_label.dart';

/// The selectable complaint categories. The localized label is resolved at
/// build time; the [value] is what gets sent to the backend.
enum ComplaintType {
  harassment,
  spam,
  inappropriate,
  fakeProfile,
  other;

  String label(AppLocalizations l10n) {
    switch (this) {
      case ComplaintType.harassment:
        return l10n.report_type_harassment;
      case ComplaintType.spam:
        return l10n.report_type_spam;
      case ComplaintType.inappropriate:
        return l10n.report_type_inappropriate;
      case ComplaintType.fakeProfile:
        return l10n.report_type_fake_profile;
      case ComplaintType.other:
        return l10n.report_type_other;
    }
  }
}

class ComplaintTypeDropdown extends StatelessWidget {
  final ComplaintType? value;
  final ValueChanged<ComplaintType?> onChanged;

  const ComplaintTypeDropdown({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final colorScheme = AppColorScheme.of(context);
    final textTheme = AppTextTheme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FieldLabel(text: l10n.report_user_type_label),
        DropdownButtonFormField<ComplaintType>(
          initialValue: value,
          isExpanded: true,
          dropdownColor: AppColors.jacarta.value,
          iconEnabledColor: AppColors.white.value,
          hint: Text(
            l10n.report_user_type_hint,
            style: textTheme.regular14.copyWith(
              color: AppColors.white.value.withValues(alpha: 0.6),
            ),
          ),
          style: textTheme.regular14.copyWith(
            color: colorScheme.onPrimary,
          ),
          decoration: InputDecoration(
            filled: true,
        fillColor: AppColors.white.value.withValues(alpha: 0.15),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 15.0,
          vertical: 7.0,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.white.value.withValues(alpha: 0.2),
            width: 0.5,
          ),
          borderRadius: BorderRadius.circular(12.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.darkOrchid.value,
            width: 0.5,
          ),
          borderRadius: BorderRadius.circular(12.0),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: colorScheme.onError,
            width: 0.5,
          ),
          borderRadius: BorderRadius.circular(12.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: colorScheme.onError,
            width: 0.5,
          ),
          borderRadius: BorderRadius.circular(12.0),
        ),
        errorStyle: textTheme.regular14.copyWith(
          color: colorScheme.onError,
        ),
      ),
          items: ComplaintType.values
              .map(
                (type) => DropdownMenuItem<ComplaintType>(
                  value: type,
                  child: Text(type.label(l10n)),
                ),
              )
              .toList(),
          validator: (value) =>
              value == null ? l10n.report_user_type_required : null,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
