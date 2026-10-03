import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../../domain/models/specialization/specialization.dart';
import '../../../widgets/survey_card/survey_card.dart';

class SpecializationList extends StatelessWidget {
  final List<Specialization> specializations;
  final bool Function(Specialization) isSelected;
  final Function(Specialization) onSelect;
  final Function(RenderBox, Specialization)? onLongPress;

  const SpecializationList({
    super.key,
    required this.specializations,
    required this.isSelected,
    required this.onSelect,
    this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.symmetric(
        vertical: 20.0,
      ),
      separatorBuilder: (context, index) => Gap(
        20.0,
      ),
      itemBuilder: (context, index) {
        final e = specializations[index];

        return SurveyCard(
          isSelected: isSelected(e),
          colors: e.colors,
          icon: e.icon,
          title: e.name,
          description: e.particulars.join(
            ',',
          ),
          onTap: () => onSelect(
            e,
          ),
          onLongPress: (renderBox) => onLongPress?.call(
            renderBox,
            e,
          ),
        );
      },
      itemCount: specializations.length,
    );
  }
}
