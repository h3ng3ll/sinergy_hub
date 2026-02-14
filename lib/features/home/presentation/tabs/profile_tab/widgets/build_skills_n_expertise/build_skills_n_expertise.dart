import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../../../../user/presentation/bloc/user_cubit/user_cubit.dart';
import '../build_user_title_widget.dart';
import '../shadow_container.dart';
import 'build_skill_item.dart';

class BuildSkillsNExpertise extends StatefulWidget {
  final VoidCallback onTapEdit;

  const BuildSkillsNExpertise({
    super.key,
    required this.onTapEdit,
  });

  @override
  State<BuildSkillsNExpertise> createState() => _BuildSkillsNExpertiseState();
}

class _BuildSkillsNExpertiseState extends State<BuildSkillsNExpertise> {
  bool isShortInfo = true;

  @override
  Widget build(BuildContext context) {
    final userCubit = context.watch<UserCubit>();
    final skills = userCubit.state.userData?.profiler.skills ?? [];
    return ShadowContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BuildUserTitleWidget(
            onTapEdit: widget.onTapEdit,
            title: 'Skills & Expertise',
          ),
          Gap(20.0),
          Wrap(
            spacing: 10.0,
            alignment: WrapAlignment.start,
            runAlignment: WrapAlignment.start,
            crossAxisAlignment: WrapCrossAlignment.start,
            runSpacing: 7.0,
            children:
                (isShortInfo
                        ? skills.take(
                            4,
                          )
                        : skills)
                    .map((e) {
                      return BuildSkillItem(
                        skill: e,
                      );
                    })
                    .toList(),
          ),
          if (skills.length > 4)
            TextButton(
              onPressed: () => setState(
                () => isShortInfo = !isShortInfo,
              ),
              child: Text(
                'Show more',
              ),
            ),
        ],
      ),
    );
  }
}
