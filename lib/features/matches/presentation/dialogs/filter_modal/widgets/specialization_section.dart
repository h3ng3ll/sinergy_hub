import 'package:flutter/material.dart';

import '../../../../../../../core/resources/colors/app_gradients.dart';
import '../../../../../../../core/resources/text/app_text_theme.dart';
import '../../../../../onboard_survey/domain/models/specialization/specialization.dart';
import '../../../../../onboard_survey/domain/models/specializations/specializations.dart';

/// Specialization section widget with 2-column grid of selectable chips.
class SpecializationSection extends StatelessWidget {
  final ESpecialization? selectedSpecialization;
  final ValueChanged<ESpecialization?> onSpecializationSelected;

  const SpecializationSection({
    super.key,
    required this.selectedSpecialization,
    required this.onSpecializationSelected,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = AppTextTheme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 12.0),
          child: Text(
            'Specialization',
            style: textTheme.medium18.copyWith(
              color: const Color(0xff666666),
            ),
          ),
        ),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 8.0,
            crossAxisSpacing: 8.0,
            childAspectRatio: 3.5,
          ),
          itemCount: Specializations.all.length,
          itemBuilder: (context, index) {
            final specialization = Specializations.all.values.elementAt(
              index,
            );

            final isSelected =
                selectedSpecialization == specialization.specialization;
            return _SpecializationChip(
              specialization: specialization,
              isSelected: isSelected,
              onTap: () => onSpecializationSelected(
                isSelected ? null : specialization.specialization,
              ),
            );
          },
        ),
      ],
    );
  }
}

class _SpecializationChip extends StatelessWidget {
  final Specialization specialization;
  final bool isSelected;
  final VoidCallback onTap;

  const _SpecializationChip({
    required this.specialization,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = AppTextTheme.of(context);

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: isSelected ? null : const Color(0xfff5f5f5),
          gradient: isSelected ? AppGradients.bluePurple : null,
        ),
        child: Center(
          child: Text(
            specialization.name,
            style: textTheme.medium12.copyWith(
              color: isSelected ? Colors.white : const Color(0xff666666),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ),
    );
  }
}
