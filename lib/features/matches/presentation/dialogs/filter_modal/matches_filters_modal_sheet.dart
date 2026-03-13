import 'package:flutter/material.dart';

import '../../../../../../../core/resources/text/app_text_theme.dart';
import '../../../../../../../core/widgets/btn/action_btn.dart';
import '../../../../../core/resources/colors/app_colors.dart';
import '../../../../../core/widgets/btn/app_btn.dart';
import '../../../../onboard_survey/domain/models/experience/experience.dart';
import '../../../../onboard_survey/domain/models/skill/skill.dart';
import '../../../../onboard_survey/domain/models/specialization/specialization.dart';
import '../../../domain/models/matches_filter/matches_filter.dart';
import 'widgets/experience_level_section.dart';
import 'widgets/filter_header.dart';
import 'widgets/skills_section.dart';
import 'widgets/specialization_section.dart';

/// Matches filters modal bottom sheet widget.
///
/// Shows a modal bottom sheet with filter options including:
/// - Experience level (single select)
/// - Specialization (single select, grid layout)
/// - Skills (multi-select chips)
/// - Apply Filters button
class MatchesFiltersModalSheet extends StatefulWidget {
  final MatchesFilter initialOptions;
  final ValueChanged<MatchesFilter>? onApply;

  const MatchesFiltersModalSheet({
    super.key,
    required this.initialOptions,
    this.onApply,
  });

  /// Shows the matches filters modal bottom sheet.
  static Future<MatchesFilter?> show(
    BuildContext context, {
    required MatchesFilter initialOptions,
  }) {
    return showModalBottomSheet<MatchesFilter>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => MatchesFiltersModalSheet(
        initialOptions: initialOptions,
        onApply: (options) => Navigator.pop(
          context,
          options,
        ),
      ),
    );
  }

  @override
  State<MatchesFiltersModalSheet> createState() =>
      _MatchesFiltersModalSheetState();
}

class _MatchesFiltersModalSheetState extends State<MatchesFiltersModalSheet> {
  late MatchesFilter _options;

  @override
  void initState() {
    super.initState();
    _options = widget.initialOptions;
  }

  void _onExperienceLevelSelected(EExperience? level) {
    setState(() {
      _options = _options.copyWith(experience: level);
    });
  }

  void _onSpecializationSelected(ESpecialization? specialization) {
    setState(() {
      _options = _options.copyWith(specialization: specialization);
    });
  }

  void _onSkillToggled(Skill skill) {
    setState(() {
      _options = _options.toggleSkill(
        skill,
      );
    });
  }

  void _onApply() {
    widget.onApply?.call(_options);
  }


  void _onClose() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final maxHeight = MediaQuery.of(context).size.height * 0.9;
    return Container(
      height: maxHeight,
      decoration: BoxDecoration(
        color: AppColors.pinkLace.value,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20.0),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FilterHeader(
            onClose: _onClose,

          ),
          Flexible(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ExperienceLevelSection(
                    selectedLevel: _options.experience,
                    onLevelSelected: _onExperienceLevelSelected,
                  ),
                  const SizedBox(height: 24.0),
                  SpecializationSection(
                    selectedSpecialization: _options.specialization,
                    onSpecializationSelected: _onSpecializationSelected,
                  ),
                  const SizedBox(height: 24.0),
                  SkillsSection(
                    skills: _options.skills,
                    onSkillToggled: _onSkillToggled,
                    selectedSkills: _options.skills,
                  ),
                  const SizedBox(height: 32.0),
                  _ApplyButton(
                    onPressed: _onApply,
                    hasActiveFilters: _options.isApplied,
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 32.0),
        ],
      ),
    );
  }
}

class _ApplyButton extends StatelessWidget {
  final VoidCallback onPressed;
  final bool hasActiveFilters;

  const _ApplyButton({
    required this.onPressed,
    required this.hasActiveFilters,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = AppTextTheme.of(context);

    return Center(
      child: PrimaryBtn(
        onPressed: hasActiveFilters ? onPressed : null,
        text: 'Apply Filters',
        padding: EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 14.0,
        ),
        // anyStateColor: AppColors.black.value,
        borderRadius: BorderRadius.circular(28.0),
        // child: Container(
        //   width: double.infinity,
        //   height: 56.0,
        //   alignment: Alignment.center,
        //   child: Text(
        //     'Apply Filters',
        //     style: textTheme.semiBold17.copyWith(
        //       color: Colors.white,
        //     ),
        //   ),
        // ),
      ),
    );
  }
}
