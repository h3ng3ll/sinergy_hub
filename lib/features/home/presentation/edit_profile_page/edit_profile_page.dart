import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/di/injection.dart';
import '../../../../core/resources/colors/app_color_scheme.dart';
import '../../../../core/resources/text/app_text_theme.dart';
import '../../../../core/resources/translations/app_localizations.dart';
import '../../../../core/routes/init_router/init_router.dart';
import '../../../../core/routes/presentation/loading_data_widget.dart';
import '../../../../core/services/geolocation/i_geolocation_service.dart';
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
import '../../../user/presentation/widgets/build_location_section/build_location_section.dart';
import '../home_bottom_bar/widgets/build_animated_background/build_animated_background.dart';
import 'bloc/edit_profile_page_bloc/edit_profile_page_bloc.dart';
import 'widgets/build_grouped_input.dart';
import 'widgets/build_skills_section/build_skills_section.dart';
import 'widgets/build_specialization_field.dart';
import '../../../../core/widgets/inputs/age_input.dart';
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
  final TextEditingController _ageController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController _bioController = TextEditingController();
  final TextEditingController _skillController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
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
    _ageController.text =
        userCubit.state.userData?.age?.toString() ?? _ageController.text;
    _bioController.text =
        userCubit.state.userData?.aboutMe ?? _bioController.text;
    _countryController.text =
        userCubit.state.userData?.location?.country ?? _countryController.text;
    _cityController.text =
        userCubit.state.userData?.location?.city ?? _cityController.text;

    super.initState();
  }

  @override
  void dispose() {
    _editProfilePageBloc.close();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _ageController.dispose();
    _bioController.dispose();
    _skillController.dispose();
    _countryController.dispose();
    _cityController.dispose();
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
    if (!_formKey.currentState!.validate()) return;
    _editProfilePageBloc.add(
      EditProfilePageEvent.applyChanges(
        firstName: _firstNameController.text,
        lastName: _lastNameController.text,
        age: int.parse(_ageController.text),
        aboutMe: _bioController.text,
        country: _countryController.text,
        city: _cityController.text,
        img: image,
      ),
    );
  }

  void onUseMyLocation() {
    _editProfilePageBloc.add(
      const EditProfilePageEvent.detectLocation(),
    );
  }

  Future<void> onOpenLocationSettings() async {
    final target = _editProfilePageBloc.state.locationSettingsTarget;
    if (target == null) return;
    await getIt<IGeolocationService>().openSettings(target);
  }

  void _onLocationDetected(EditProfilePageState state) {
    final place = state.detectedPlace;
    if (place == null) return;
    if (place.country != null) _countryController.text = place.country!;
    if (place.city != null) _cityController.text = place.city!;
  }

  Future<void> onTapAvatar() async {
    final picked = await ImageSourceModalSheet.show();
    if (picked == null) return;
    image = picked;
    setState(() {});
  }

  void onTapSpecialization() {
    EditSpecializationRoute().push(
      context,
    );
  }

  void onCancel() {
    context.pop();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColorScheme.of(context);
    final textTheme = AppTextTheme.of(context);
    final lo = AppLocalizations.of(context)!;
    return BlocProvider<EditProfilePageBloc>.value(
      value: _editProfilePageBloc,
      child: MultiBlocListener(
        listeners: [
          BlocListener<EditProfilePageBloc, EditProfilePageState>(
            bloc: _editProfilePageBloc,
            listener: (context, state) {
              if (state.isUpdated) {
                if (state.locationError.isNotEmpty) {
                  UiMessageService.showError(
                    state.locationError,
                  );
                } else {
                  UiMessageService.showSuccess(
                    'Profile updated successfully',
                  );
                }
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
          BlocListener<EditProfilePageBloc, EditProfilePageState>(
            bloc: _editProfilePageBloc,
            // Fires on every finished, successful detection — not only when the
            // place differs — so a repeat tap refills text the user edited.
            listenWhen: (p, n) =>
                p.isDetectingLocation &&
                !n.isDetectingLocation &&
                n.locationError.isEmpty,
            listener: (context, state) => _onLocationDetected(state),
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
                        child: Form(
                          key: _formKey,
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
                                    title: 'Age',
                                    child: AgeInput(
                                      controller: _ageController,
                                    ),
                                  ),
                                  BuildGroupedInput(
                                    title: 'Bio',
                                    child: BioInput(
                                      controller: _bioController,
                                    ),
                                  ),
                                  BuildGroupedInput(
                                    title: 'Specialization',
                                    child: BuildSpecializationField(
                                      specialization:
                                          userData?.profiler.specialization,
                                      onTap: onTapSpecialization,
                                    ),
                                  ),
                                  BuildGroupedInput(
                                    title: lo.location_group_title,
                                    child: BuildLocationSection(
                                      countryController: _countryController,
                                      cityController: _cityController,
                                      isDetecting: state.isDetectingLocation,
                                      errorMessage: state.locationError,
                                      settingsTarget:
                                          state.locationSettingsTarget,
                                      onUseMyLocation: onUseMyLocation,
                                      onOpenSettings: onOpenLocationSettings,
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
