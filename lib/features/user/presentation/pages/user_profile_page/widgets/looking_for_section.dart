import 'package:flutter/material.dart';

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
      title: 'Looking for',
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
