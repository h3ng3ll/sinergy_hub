import 'package:flutter/material.dart';

import '../../../../../../core/resources/translations/app_localizations.dart';
import '../../../../../onboard_survey/domain/models/specialization/specialization.dart';
import 'profile_section_card.dart';
import 'specialization_pill.dart';

class LookingForSection extends StatelessWidget {
  final List<ESpecialization> specializations;

  const LookingForSection({
    super.key,
    required this.specializations,
  });

  @override
  Widget build(BuildContext context) {
    return ProfileSectionCard(
      title: AppLocalizations.of(context)!.looking_for,
      icon: Icons.travel_explore,
      child: Wrap(
        spacing: 10.0,
        runSpacing: 10.0,
        children: specializations
            .map(
              (specialization) => SpecializationPill(
                specialization: specialization,
              ),
            )
            .toList(),
      ),
    );
  }
}
