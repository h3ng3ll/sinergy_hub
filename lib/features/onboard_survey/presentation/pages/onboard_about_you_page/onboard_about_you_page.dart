import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/di/injection.dart';
import '../../../../../core/resources/colors/app_color_scheme.dart';
import '../../../../../core/resources/text/app_text_theme.dart';
import '../../../../../core/services/permission_requester_service.dart';
import '../../../../../core/services/ui_message_service.dart';
import '../../../../../core/widgets/btn/custom_text_btn.dart';
import '../../../../../core/widgets/btn/translucent_btn.dart';
import '../../../../../core/widgets/build_user_avatar.dart';
import '../../../../../core/widgets/custom_app_bar.dart';
import '../../../../../core/widgets/inputs/bio_input.dart';
import '../../../../../core/widgets/inputs/first_name_input.dart';
import '../../../../../core/widgets/inputs/last_name_input.dart';
import '../../../../../core/widgets/padding/horizontal_padding.dart';
import '../../../../home/presentation/home_bottom_bar/widgets/build_animated_background/build_animated_background.dart';
import '../../../../home/presentation/edit_profile_page/bloc/edit_profile_page_bloc/edit_profile_page_bloc.dart';
import '../../../../home/presentation/edit_profile_page/widgets/build_grouped_input.dart';
import '../../../../home/presentation/edit_profile_page/widgets/build_skills_section/build_skills_section.dart';
import '../../../../user/domain/models/user_data/user_data.dart';
import '../../../../user/domain/usecases/listen_current_user_data_use_case.dart';
import '../../../../user/domain/usecases/update_user_usecase.dart';
import '../../../../user/presentation/bloc/skills_bloc/skills_bloc.dart';
import '../../../../user/presentation/bloc/user_bloc/user_bloc.dart';
import '../../../../user/presentation/bloc/user_update_cubit/user_update_cubit.dart';
import '../../../domain/models/skill/skill.dart';
import '../../../domain/models/user_profiler/user_profiler.dart';
import '../../../domain/use_cases/get_skills_use_case.dart';
import '../../bloc/onboard_bloc/onboard_bloc.dart';

class OnboardAboutYouPage extends StatefulWidget {
  const OnboardAboutYouPage({super.key});

  @override
  State<OnboardAboutYouPage> createState() => _OnboardAboutYouPageState();
}

class _OnboardAboutYouPageState extends State<OnboardAboutYouPage> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  final TextEditingController _skillController = TextEditingController();
  Uint8List? image;
  final GlobalKey<FormState> _formKey = GlobalKey();
  late final EditProfilePageBloc _editProfilePageBloc;
  late final UserUpdateCubit _userUpdateCubit;

  @override
  void initState() {
    final userCubit = context.read<UserBloc>();
    _editProfilePageBloc = EditProfilePageBloc(
      listenCurrentUserDataUseCase: getIt<ListenCurrentUserDataUseCase>(),
      updateUserUseCase: getIt<UpdateUserUseCase>(),
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

  void onNext() {
    if (!_formKey.currentState!.validate()) return;
    final skills = _editProfilePageBloc.state.skills;
    final userData = context.read<UserBloc>().state.userData;

    _userUpdateCubit.update(
      userData != null
          ? userData.copyWith(
              firstName: _firstNameController.text,
              lastName: _lastNameController.text,
              aboutMe: _bioController.text,
              profiler: userData.profiler.copyWith(
                skills: skills,
              ),
            )
          : UserData.none().copyWith(
              firstName: _firstNameController.text,
              lastName: _lastNameController.text,
              aboutMe: _bioController.text,
              profiler: UserProfiler.none(),
            ),
      image,
    );

    context.read<OnboardBloc>().add(
      OnboardEvent.update(
        toldAboutYourself: true,
      ),
    );
  }

  Future<void> onTapAvatar() async {
    final Uint8List? image = await getIt<PermissionRequester>().onPickCamera(
      context,
    );
    if (image == null) return;
    this.image = image;
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
        listenWhen: (p, n) => p.status == UserStatus.loading,
        listener: (context, state) {
          if (state.status == UserStatus.failed) {
            UiMessageService.showError(
              state.errorMessage,
            );
          } else if (state.status == UserStatus.updated) {
            UiMessageService.showSuccess(
              'Profile updated successfully',
            );
          }
        },
        child: BlocBuilder<EditProfilePageBloc, EditProfilePageState>(
          builder: (context, state) {
            final availableSkills = context.watch<SkillsBloc>().state.skills;

            return BuildAnimatedBackground(
              child: SafeArea(
                child: Scaffold(
                  backgroundColor: Colors.transparent,
                  appBar: CustomAppBar(
                    actions: [
                      Spacer(),
                      Center(
                        child: Text(
                          'Tell About yourself',
                          style: textTheme.bold20.copyWith(
                            color: colorScheme.onPrimary,
                          ),
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                  body: SingleChildScrollView(
                    child: Form(
                      key: _formKey,
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
                            Text(
                              'Skills',
                              style: textTheme.regular14.copyWith(
                                color: colorScheme.onPrimary,
                              ),
                            ),
                            BuildSkillsSection(
                              onRemoveExistingSkill: onRemoveExistingSkill,
                              onSubmitSkill: onSubmitSkill,
                              skills: availableSkills,
                              activeSkills: state.skills,

                            ),
                            // Spacer(),
                            Row(
                              spacing: 20.0,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomTextBtn(
                                  onPressed: onCancel,
                                  text: 'Cancel',
                                ),
                                TranslucentBtn(
                                  onPressed: onNext,
                                  child: Text(
                                    'Next',
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
            );
          },
        ),
      ),
    );
  }
}
