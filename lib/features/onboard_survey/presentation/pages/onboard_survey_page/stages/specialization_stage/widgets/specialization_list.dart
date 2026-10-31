import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../../domain/models/specialization/specialization.dart';
import '../../../../../../../user/presentation/widgets/survey_card_grid/survey_card_grid.dart';
import '../../../widgets/survey_card/survey_card.dart';

class SpecializationList extends StatelessWidget {
  final List<Specialization> specializations;
  final bool Function(Specialization) isSelected;
  final Function(Specialization) onSelect;
  final Function(RenderBox, Specialization)? onLongPress;

  /// 1 = vertical list (mobile); 2 = two-column grid (tablet/desktop).
  final int columns;

  const SpecializationList({
    super.key,
    required this.specializations,
    required this.isSelected,
    required this.onSelect,
    this.onLongPress,
    this.columns = 1,
  });

  Widget _buildCard(BuildContext context, int index) {
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
  }

  @override
  Widget build(BuildContext context) {
    if (columns > 1) {
      return SurveyCardGrid(
        itemCount: specializations.length,
        itemBuilder: _buildCard,
      );
    }

    return ListView.separated(
      padding: EdgeInsets.symmetric(
        vertical: 20.0,
      ),
      separatorBuilder: (context, index) => Gap(
        20.0,
      ),
      itemBuilder: _buildCard,
      itemCount: specializations.length,
    );
  }
}
