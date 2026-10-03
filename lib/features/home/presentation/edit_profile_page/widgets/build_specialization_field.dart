import 'package:flutter/material.dart';

import '../../../../../core/resources/colors/app_color_scheme.dart';
import '../../../../../core/widgets/custom_text_field.dart';
import '../../../../onboard_survey/domain/models/specialization/specialization.dart';
import '../../../../onboard_survey/domain/models/specializations/specializations.dart';

class BuildSpecializationField extends StatelessWidget {
  final ESpecialization? specialization;
  final VoidCallback onTap;

  const BuildSpecializationField({
    super.key,
    required this.specialization,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColorScheme.of(context);
    final name = specialization == null
        ? ''
        : Specializations.get(specialization!).name;

    return CustomTextField(
      key: ValueKey(name),
      initialValue: name,
      hintText: 'Specialization',
      readOnly: true,
      onTap: specialization == null ? null : onTap,
      suffixIcon: Icon(
        Icons.chevron_right,
        color: colorScheme.onPrimary,
      ),
    );
  }
}
