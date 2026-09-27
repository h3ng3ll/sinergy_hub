import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../core/resources/text/app_text_theme.dart';
import '../../../../../core/resources/colors/app_colors.dart';
import '../../../../../core/widgets/btn/app_btn.dart';
import '../../../../home/presentation/edit_profile_page/widgets/build_skills_section/build_skills_section.dart';
import '../../../../onboard_survey/domain/models/experience/experience.dart';
import '../../../../onboard_survey/domain/models/skill/skill.dart';
import '../../../../onboard_survey/domain/models/specialization/specialization.dart';
import '../../../../user/presentation/bloc/skills_bloc/skills_bloc.dart';
import '../../../../user/presentation/bloc/user_bloc/user_bloc.dart';
import '../../../domain/models/e_location_filter_mode.dart';
import '../../../domain/models/matches_filter/matches_filter.dart';
import 'widgets/experience_level_section.dart';
import 'widgets/filter_header.dart';
import 'widgets/location_section.dart';
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
  final TextEditingController _countryController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _options = widget.initialOptions;
    // City mode prefills from whatever the filter already has; falling back
    // to the caller's own profile location makes "search near where I am"
    // the zero-effort default.
    final ownLocation = context.read<UserBloc>().state.userData?.location;
    _countryController.text = _options.country ?? ownLocation?.country ?? '';
    _cityController.text = _options.city ?? ownLocation?.city ?? '';
  }

  @override
  void dispose() {
    _countryController.dispose();
    _cityController.dispose();
    super.dispose();
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

  void _onLocationModeSelected(ELocationFilterMode tapped) {
    setState(() {
      if (_options.locationMode == tapped) {
        _options = _options.clearLocation();
        return;
      }

      _options = tapped == ELocationFilterMode.place
          ? _options.setPlaceLocation(
              country: _countryController.text,
              city: _cityController.text,
            )
          : _options.setRadiusLocation();
    });
  }

  void _onRadiusChanged(int radiusKm) {
    setState(() {
      _options = _options.copyWith(radiusKm: radiusKm);
    });
  }

  void _onAddSkill(String skill) {
    setState(() {
      _options = _options.add(
        Skill(
          name: skill,
        ),
      );
    });
  }

  void _onDeleteSkill(Skill skill) {
    setState(() {
      _options = _options.remove(
        skill,
      );
    });
  }

  void _onApply() {
    var options = _options;
    if (options.isPlaceMode) {
      options = options.copyWith(
        country: _countryController.text.trim().isEmpty
            ? null
            : _countryController.text.trim(),
        city: _cityController.text.trim().isEmpty
            ? null
            : _cityController.text.trim(),
      );
    }
    widget.onApply?.call(options);
  }

  void _onClose() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final keyboardHeight = mediaQuery.viewInsets.bottom;
    // Anchor the sheet's top edge at 10% of the screen height regardless
    // of the keyboard. Bottom padding equals the keyboard inset so the
    // content (incl. skill input) sits above it; the sheet's content area
    // shrinks from the bottom only — the top doesn't move.
    final sheetHeight = mediaQuery.size.height * 0.9;
    final skills = context.watch<SkillsBloc>().state.skills;
    final textTheme = AppTextTheme.of(context);

    return Container(
      height: sheetHeight,
      decoration: BoxDecoration(
        color: AppColors.pinkLace.value,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20.0),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(bottom: keyboardHeight),
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
                    LocationSection(
                      mode: _options.locationMode,
                      onModeSelected: _onLocationModeSelected,
                      countryController: _countryController,
                      cityController: _cityController,
                      radiusKm: _options.radiusKm ?? kDefaultLocationRadiusKm,
                      onRadiusChanged: _onRadiusChanged,
                      hasCoordinates:
                          context.watch<UserBloc>().state.userData?.location
                              ?.hasCoordinates ??
                          false,
                    ),
                    const SizedBox(height: 24.0),

                    Text(
                      'Skills',
                      style: textTheme.medium18,
                    ),
                    const SizedBox(height: 12.0),
                    BuildSkillsSection(
                      onRemoveExistingSkill: _onDeleteSkill,
                      onSubmitSkill: _onAddSkill,
                      skills: skills,
                      activeSkills: _options.skills,
                      isVisibleInput: !_options.isExceeded,
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
    return Center(
      child: PrimaryBtn(
        onPressed: hasActiveFilters ? onPressed : null,
        text: 'Apply Filters',
        padding: EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 14.0,
        ),
        borderRadius: BorderRadius.circular(28.0),
      ),
    );
  }
}
