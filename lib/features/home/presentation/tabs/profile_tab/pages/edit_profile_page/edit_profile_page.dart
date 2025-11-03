import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../../core/resources/colors/app_color_scheme.dart';
import '../../../../../../../core/resources/text/app_text_theme.dart';
import '../../../../../../../core/widgets/btn/action_btn.dart';
import '../../../../../../../core/widgets/btn/custom_text_btn.dart';
import '../../../../../../../core/widgets/btn/translucent_btn.dart';
import '../../../../../../../core/widgets/custom_app_bar.dart';
import '../../../../../../../core/widgets/padding/horizontal_padding.dart';
import '../../../../../../onboard_survey/doman/models/skill/skill.dart';
import '../../../../../../user/presentation/bloc/user_cubit/user_cubit.dart';
import '../../../../home_bottom_bar/widgets/build_animated_background/build_animated_background.dart';
import 'bloc/edit_profile_page_bloc/edit_profile_page_bloc.dart';
import 'widgets/build_grouped_input.dart';
import 'widgets/build_skills_section/build_skills_section.dart';
import 'widgets/inputs/bio_input.dart';
import 'widgets/inputs/first_name_input.dart';
import 'widgets/inputs/last_name_input.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  final TextEditingController _skillController = TextEditingController();

  late final EditProfilePageBloc _editProfilePageBloc;

  @override
  void initState() {
    final userCubit = context.read<UserCubit>();

    _editProfilePageBloc = EditProfilePageBloc(
      userCubit: userCubit,
    );

    _firstNameController.text =
        userCubit.state.userData?.firstName ?? _firstNameController.text;
    _lastNameController.text =
        userCubit.state.userData?.lastName ?? _lastNameController.text;
    _bioController.text =
        userCubit.state.userData?.aboutMe ?? _bioController.text;

    super.initState();
  }

  @override
  void dispose() {
    _editProfilePageBloc.close();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _bioController.dispose();
    _skillController.dispose();
    super.dispose();
  }

  void onSubmitSkill(String skill) {
    if (skill.isEmpty) return;
    _editProfilePageBloc.add(
      EditProfilePageEvent.addSkill(
        name: skill,
      ),
    );
    _skillController.clear();
  }

  void onRemoveExistingSkill(Skill skill) {
    _editProfilePageBloc.add(
      EditProfilePageEvent.removeSkill(
        skill: skill,
      ),
    );
  }

  void onSaveChanges() {
    final skills = _editProfilePageBloc.state.skills;
    final userData = context.read<UserCubit>().state.userData!;

    context.read<UserCubit>().update(
      userData.copyWith(
        firstName: _firstNameController.text,
        lastName: _lastNameController.text,
        aboutMe: _bioController.text,
        profiler: userData.profiler.copyWith(
          skills: skills,
        ),
      ),
    );
  }

  void onCancel() {
    context.pop();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColorScheme.of(context);
    final textTheme = AppTextTheme.of(context);
    return BlocProvider<EditProfilePageBloc>.value(
      value: _editProfilePageBloc,
      child: BuildAnimatedBackground(
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: CustomAppBar(
              actions: [
                Spacer(),
                Center(
                  child: Text(
                    'Edit Profile',
                    style: textTheme.bold20.copyWith(
                      color: colorScheme.onPrimary,
                    ),
                  ),
                ),
                Spacer(),
              ],
            ),
            body: HorizontalPadding(
              child: Column(
                spacing: 20,
                children: [
                  BuildGroupedInput(
                    title: 'FirstName',
                    child: FirstNameInput(
                      controller: _firstNameController,
                    ),
                  ),
                  BuildGroupedInput(
                    title: 'LastName',
                    child: LastNameInput(
                      controller: _lastNameController,
                    ),
                  ),
                  BuildGroupedInput(
                    title: 'Bio',
                    child: BioInput(
                      controller: _bioController,
                    ),
                  ),
                  BuildSkillsSection(
                    onRemoveExistingSkill: onRemoveExistingSkill,
                    skillController: _skillController,
                    onSubmitSkill: onSubmitSkill,
                  ),
                  Spacer(),
                  Row(
                    spacing: 20.0,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomTextBtn(
                        onPressed: onCancel,
                        text: 'Cancel',
                      ),
                      TranslucentBtn(
                        onPressed: onSaveChanges,
                        child: Text(
                          'Save Changes',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
