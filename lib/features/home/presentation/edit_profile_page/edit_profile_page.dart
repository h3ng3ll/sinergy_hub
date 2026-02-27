import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/di/injection.dart';
import '../../../../core/resources/colors/app_color_scheme.dart';
import '../../../../core/resources/text/app_text_theme.dart';
import '../../../../core/services/permission_requester_service.dart';
import '../../../../core/services/ui_message_service.dart';
import '../../../../core/widgets/btn/custom_text_btn.dart';
import '../../../../core/widgets/btn/translucent_btn.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/padding/horizontal_padding.dart';
import '../../../../core/widgets/build_user_avatar.dart';
import '../../../onboard_survey/domain/models/skill/skill.dart';
import '../../../user/domain/repositories/i_user_repository.dart';
import '../../../user/domain/usecases/update_user_usecase.dart';
import '../../../user/presentation/bloc/user_bloc/user_bloc.dart';
import '../../../user/presentation/bloc/user_update_cubit/user_update_cubit.dart';
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
  late final UserUpdateCubit _userUpdateCubit;

  @override
  void initState() {
    final userCubit = context.read<UserBloc>();
    _editProfilePageBloc = EditProfilePageBloc(
      userRepository: getIt<IUserRepository>(),
    );
    _userUpdateCubit = UserUpdateCubit(
      updateUserUseCase: getIt<UpdateUserUseCase>(),
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
    final userData = context.read<UserBloc>().state.userData!;

    _userUpdateCubit.update(
      userData.copyWith(
        firstName: _firstNameController.text,
        lastName: _lastNameController.text,
        aboutMe: _bioController.text,
        profiler: userData.profiler.copyWith(
          skills: skills,
        ),
      ),
      image,
    );
  }

  Future<void> onTapAvatar() async {
    final File? image = await getIt<PermissionRequester>().onPickCamera(
      context,
    );
    if (image == null) return;
    this.image = image.readAsBytesSync();
    setState(() {});
  }

  void onCancel() {
    context.pop();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColorScheme.of(context);
    final textTheme = AppTextTheme.of(context);
    final userData = context.read<UserBloc>().state.userData;
    return BlocProvider<EditProfilePageBloc>.value(
      value: _editProfilePageBloc,
      child: BlocListener<UserBloc, UserState>(
        listener: (context, state) {
          if (state.status == UserStatus.failed) {
            UiMessageService.showError(
              state.errorMessage,
            );
          } else if (state.status == UserStatus.updated) {
            UiMessageService.showSuccess(
              'Profile updated successfully',
            );
            context.pop();
          }
        },
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
              body: SingleChildScrollView(
                child: HorizontalPadding(
                  child: Column(
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
                      BuildSkillsSection(
                        onRemoveExistingSkill: onRemoveExistingSkill,
                        skillController: _skillController,
                        onSubmitSkill: onSubmitSkill,
                      ),
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
        ),
      ),
    );
  }
}
