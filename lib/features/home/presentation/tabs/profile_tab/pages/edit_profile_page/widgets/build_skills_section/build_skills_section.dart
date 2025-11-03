import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../../onboard_survey/doman/models/skill/skill.dart';
import '../../bloc/edit_profile_page_bloc/edit_profile_page_bloc.dart';
import '../build_grouped_input.dart';
import '../inputs/skill_input.dart';
import 'build_selected_skill_item.dart';

class BuildSkillsSection extends StatelessWidget {
  final TextEditingController skillController;
  final Function(String) onSubmitSkill;
  final Function(Skill) onRemoveExistingSkill;

  const BuildSkillsSection({
    super.key,
    required this.skillController,
    required this.onSubmitSkill,
    required this.onRemoveExistingSkill,
  });

  @override
  Widget build(BuildContext context) {
    final editProfilePageBloc = context.watch<EditProfilePageBloc>();
    return BuildGroupedInput(
      title: 'Skills',
      child: Column(
        spacing: 15.0,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            spacing: 15.0,
            runSpacing: 10,
            crossAxisAlignment: WrapCrossAlignment.start,
            alignment: WrapAlignment.start,
            children: editProfilePageBloc.state.skills
                .map(
                  (e) => BuildSelectedSkillItem(
                    onTap: () => onRemoveExistingSkill(
                      e,
                    ),
                    skill: e,
                  ),
                )
                .toList(),
          ),
          SkillInput(
            controller: skillController,
            onFieldSubmitted: onSubmitSkill,
          ),
        ],
      ),
    );
  }
}
