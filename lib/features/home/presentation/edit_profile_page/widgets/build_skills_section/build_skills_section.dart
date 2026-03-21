import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../../../../core/resources/text/app_text_theme.dart';
import '../../../../../onboard_survey/domain/models/skill/skill.dart';
import '../../../tabs/profile_tab/widgets/build_skills_n_expertise/build_skill_item.dart';
import '../../bloc/edit_profile_page_bloc/edit_profile_page_bloc.dart';
import '../build_grouped_input.dart';
import '../../../../../../core/widgets/inputs/skill_input.dart';
import 'build_selected_skill_item.dart';

class BuildSkillsSection extends StatelessWidget {
  final Function(String) onSubmitSkill;
  final Function(Skill) onRemoveExistingSkill;
  final List<String> skills;
  final List<Skill> activeSkills;
  final bool isVisibleInput;

  const BuildSkillsSection({
    super.key,
    required this.onSubmitSkill,
    required this.onRemoveExistingSkill,
    required this.skills,
    required this.activeSkills,
    this.isVisibleInput =  true,
  });

  @override
  Widget build(BuildContext context) {
    TextEditingController? autoController;
    FocusNode? focusNode;

    final textTheme = AppTextTheme.of(context);
    return Column(
      spacing: 15,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          spacing: 15.0,
          runSpacing: 10.0,
          children: activeSkills
              .map(
                (skill) => BuildSkillItem(
                  onTap: () => onRemoveExistingSkill(skill),
                  skill: skill,
                ),
              )
              .toList(),
        ),
        if(isVisibleInput) Autocomplete<String>(
          optionsBuilder: (textEditingValue) {
            if (textEditingValue.text.isEmpty) {
              return const Iterable<String>.empty();
            }

            final skills = [...this.skills];
            final existsSkills = activeSkills.map((e) => e.name).toList();

            skills.removeWhere((e) => existsSkills.contains(e));

            return skills.where(
              (skill) => skill.toLowerCase().startsWith(
                textEditingValue.text.toLowerCase(),
              ),
            );
          },
          optionsViewBuilder:
              (
                BuildContext context,
                AutocompleteOnSelected<String> onSelected,
                Iterable<String> options,
              ) {
                return Align(
                  alignment: Alignment.topLeft,
                  child: Material(
                    elevation: 6,
                    borderRadius: BorderRadius.circular(16),
                    child: Container(
                      constraints: const BoxConstraints(
                        maxHeight: 220,
                        maxWidth: 500,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: ListView.builder(
                        padding: EdgeInsets.zero,
                        itemCount: options.length,
                        itemBuilder: (context, index) {
                          final option = options.elementAt(index);

                          return InkWell(
                            onTap: () => onSelected(option),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 12,
                              ),
                              child: Text(
                                option,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                );
              },
          onSelected: (selection) {
            onSubmitSkill(selection);

            autoController?.clear();
            focusNode?.unfocus();
          },

          fieldViewBuilder:
              (
                context,
                controller,
                focus,
                onFieldSubmitted,
              ) {
                autoController = controller;
                focusNode = focus;

                return SkillInput(
                  controller: controller,
                  focusNode: focus,
                  onFieldSubmitted: (_) {
                    final text = controller.text.trim();

                    final isSuggestion = skills.any(
                      (skill) => skill.toLowerCase() == text.toLowerCase(),
                    );

                    if (text.isNotEmpty && !isSuggestion) {
                      onSubmitSkill(
                        text,
                      );
                    }

                    controller.clear();
                    focus.unfocus();
                  },
                );
              },
        ),
      ],
    );
  }
}
