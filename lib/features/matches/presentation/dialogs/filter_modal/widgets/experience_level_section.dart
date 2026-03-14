import 'package:flutter/material.dart';

import '../../../../../../../core/resources/colors/app_gradients.dart';
import '../../../../../../../core/resources/text/app_text_theme.dart';
import '../../../../../../core/widgets/padding/horizontal_padding.dart';
import '../../../../../onboard_survey/domain/models/experience/experience.dart';

/// Experience level section widget with vertical list of selectable options.
class ExperienceLevelSection extends StatelessWidget {
  final EExperience? selectedLevel;
  final ValueChanged<EExperience?> onLevelSelected;

  const ExperienceLevelSection({
    super.key,
    required this.selectedLevel,
    required this.onLevelSelected,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = AppTextTheme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Experience Level',
          style: textTheme.medium18,
        ),
        ...EExperience.values.map((level) {
          final isSelected = selectedLevel == level;
          return Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: _ExperienceLevelOption(
              level: level,
              isSelected: isSelected,
              onTap: () => onLevelSelected(isSelected ? null : level),
            ),
          );
        }),
      ],
    );
  }
}

class _ExperienceLevelOption extends StatelessWidget {
  final EExperience level;
  final bool isSelected;
  final VoidCallback onTap;

  const _ExperienceLevelOption({
    required this.level,
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
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          vertical: 14.0,
          horizontal: 16.0,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: isSelected ? null : const Color(0xfff5f5f5),
          gradient: isSelected ? AppGradients.bluePurple : null,
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
        level.name,
                style: textTheme.medium16.copyWith(
                  color: isSelected ? Colors.white : const Color(0xff666666),
                ),
              ),
            ),
            if (isSelected)
              const Icon(
                Icons.check_rounded,
                color: Colors.white,
                size: 20.0,
              ),
          ],
        ),
      ),
    );
  }
}

String _formatExperienceName(String name) {
  final withSpaces = name.replaceAll(RegExp(r'([A-Z])'), ' \$1');
  final trimmed = withSpaces.trim();
  return trimmed[0].toUpperCase() + trimmed.substring(1);
}
