import 'package:flutter/material.dart';

import '../../../../../../domain/models/experience/experience.dart';
import '../../../../../../domain/models/experiences/experiences.dart';
import 'experience_card/experience_card.dart';

class ExperienceGrid extends StatelessWidget {
  final EExperience? selectedExperience;
  final Function(EExperience) onSelectExperience;

  const ExperienceGrid({
    super.key,
    required this.selectedExperience,
    required this.onSelectExperience,
  });

  @override
  Widget build(BuildContext context) {
    final experiences = Experiences.experiences.values.toList();

    return GridView.builder(
      padding: EdgeInsets.symmetric(
        vertical: 15.0,
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisExtent: 245.0,
        crossAxisSpacing: 15.0,
        mainAxisSpacing: 15.0,
      ),
      itemCount: experiences.length,
      itemBuilder: (context, index) {
        final experience = experiences[index];

        return ExperienceCard(
          height: 245.0,
          icon: experience.icon,
          isSelected: selectedExperience == experience.experience,
          onTapCard: onSelectExperience,
          experience: experience.experience,
          name: experience.name,
          yearExperience: experience.rangeExperience,
          description: experience.description,
        );
      },
    );
  }
}
