import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/di/injection.dart';
import '../../../../core/resources/colors/app_color_scheme.dart';
import '../../../../core/resources/text/app_text_theme.dart';
import '../../../../core/routes/presentation/loading_data_widget.dart';
import '../../../../core/services/ui_message_service.dart';
import '../../../../core/widgets/btn/custom_text_btn.dart';
import '../../../../core/widgets/btn/translucent_btn.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/padding/horizontal_padding.dart';
import '../../../../core/widgets/build_user_avatar.dart';
import '../../../onboard_survey/domain/models/skill/skill.dart';
import '../../../user/presentation/bloc/skills_bloc/skills_bloc.dart';
import '../../../user/presentation/bloc/user_bloc/user_bloc.dart';
import '../../../user/presentation/dialogs/image_source_modal_sheet/image_source_modal_sheet.dart';
import '../home_bottom_bar/widgets/build_animated_background/build_animated_background.dart';
import 'bloc/edit_profile_page_bloc/edit_profile_page_bloc.dart';
import 'widgets/build_grouped_input.dart';
import 'widgets/build_skills_section/build_skills_section.dart';
import '../../../../core/widgets/inputs/bio_input.dart';
import '../../../../core/widgets/inputs/first_name_input.dart';
import '../../../../core/widgets/inputs/last_name_input.dart';

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
  Uint8List? image;

  late final EditProfilePageBloc _editProfilePageBloc;

  @override
  void initState() {
    final userCubit = context.read<UserBloc>();
    _editProfilePageBloc = getIt<EditProfilePageBloc>()
      ..add(
        EditProfilePageEvent.initialize(),
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
    _editProfilePageBloc.add(
      EditProfilePageEvent.applyChanges(
        firstName: _firstNameController.text,
        lastName: _lastNameController.text,
        aboutMe: _bioController.text,
        img: image,
      ),
    );
  }

  Future<void> onTapAvatar() async {
    final picked = await ImageSourceModalSheet.show();
    if (picked == null) return;
    image = picked;
    setState(() {});
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
      child: MultiBlocListener(
        listeners: [
          BlocListener<EditProfilePageBloc, EditProfilePageState>(
            bloc: _editProfilePageBloc,
            listener: (context, state) {
              if (state.isUpdated) {
                UiMessageService.showSuccess(
                  'Profile updated successfully',
                );
                context.pop();
              }
            },
          ),
          BlocListener<EditProfilePageBloc, EditProfilePageState>(
            bloc: _editProfilePageBloc,
            listenWhen: (p, n) =>
                (p.errorMessage != n.errorMessage) && n.isFailed,
            listener: (context, state) {
              UiMessageService.showError(
                state.errorMessage,
              );
            },
          ),
        ],
        child: BlocBuilder<EditProfilePageBloc, EditProfilePageState>(
          builder: (context, state) {
            final userData = state.userData;
            final availableSkills = context.watch<SkillsBloc>().state.skills;

            return Stack(
              children: [
                BuildAnimatedBackground(
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
                        child: ListView(
                          children: [
                            Column(
                              spacing: 20,

                              children: [
                                BuildUserAvatar(
                                  width: 100.0,
                                  height: 100.0,
                                  onTap: onTapAvatar,
                                  url: userData?.avatarUrl,
                                  cacheImg: image,
                                ),
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
                              ],
                            ),
                            Gap(15.0),
                            Text(
                              'Skills',
                              style: textTheme.regular14.copyWith(
                                color: colorScheme.onPrimary,
                              ),
                            ),
                            Gap(15.0),
                            BuildSkillsSection(
                              onRemoveExistingSkill: onRemoveExistingSkill,
                              onSubmitSkill: onSubmitSkill,
                              skills: availableSkills,
                              activeSkills: state.skills,
                            ),
                            Gap(15.0),
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
                if (state.isUpdating) LoadingDataWidget(),
              ],
            );
          },
        ),
      ),
    );
  }
}
