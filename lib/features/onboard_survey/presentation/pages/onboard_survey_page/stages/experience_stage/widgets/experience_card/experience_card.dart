import 'package:flutter/material.dart';

import '../../../../../../../doman/models/experience/experience.dart';
import 'widgets/experience_card_active_bg.dart';
import 'widgets/experience_card_content.dart';
import 'widgets/experience_card_inactive_bg.dart';

class ExperienceCard extends StatelessWidget {
  final double? height;
  final double? width;
  final String icon;
  final bool isSelected;
  final EExperience experience;
  final String name;
  final String yearExperience;
  final String description;
  final Function(EExperience) onTapCard;

  const ExperienceCard({
    super.key,
    this.height,
    this.width,
    required this.icon,
    required this.isSelected,
    required this.experience,
    required this.name,
    required this.yearExperience,
    required this.description,
    required this.onTapCard,
  });

  @override
  Widget build(BuildContext context) {
    final padding =  EdgeInsets.symmetric(
      vertical: 15.0,
      horizontal: 20.0,
    );
    return GestureDetector(
      onTap: () => onTapCard(
        experience,
      ),
      child: SizedBox(

        height: height,
        width: width,
        child: isSelected
            ? ExperienceCardActiveBg(
          padding: padding,
                child: ExperienceCardContent(

                  icon: icon,
                  experience: experience,
                  name: name,
                  yearExperience: yearExperience,
                  description: description,
                ),
              )
            : ExperienceCardInactiveBg(
          padding: padding,
                child: ExperienceCardContent(
                  icon: icon,
                  experience: experience,
                  name: name,
                  yearExperience: yearExperience,
                  description: description,
                ),
              ),
      ),
    );
  }
}
