import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/di/injection.dart';
import '../../../../../core/resources/colors/app_color_scheme.dart';
import '../../../../../core/resources/text/app_text_theme.dart';
import '../../../../../core/resources/translations/app_localizations.dart';
import '../../../../../core/routes/init_router/init_router.dart';
import '../../../../../core/services/geolocation/i_geolocation_service.dart';
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
import '../../../../user/domain/models/user_location/user_location.dart';
import '../../../../user/domain/usecases/update_user_coordinates_use_case.dart';
import '../../../../user/domain/usecases/update_user_usecase.dart';
import '../../../../user/presentation/bloc/skills_bloc/skills_bloc.dart';
import '../../../../user/presentation/bloc/user_bloc/user_bloc.dart';
import '../../../../user/presentation/bloc/user_update_cubit/user_update_cubit.dart';
import '../../../../user/presentation/dialogs/image_source_modal_sheet/image_source_modal_sheet.dart';
import '../../../../user/presentation/widgets/build_location_section/build_location_section.dart';
import '../../../domain/models/skill/skill.dart';
import '../../../domain/models/user_profiler/user_profiler.dart';
import '../../bloc/onboard_bloc/onboard_bloc.dart';
import 'bloc/onboard_about_you_bloc/onboard_about_you_bloc.dart';

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
  final TextEditingController _countryController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  Uint8List? image;
  final GlobalKey<FormState> _formKey = GlobalKey();
  late final EditProfilePageBloc _editProfilePageBloc;
  late final UserUpdateCubit _userUpdateCubit;
  late final OnboardAboutYouBloc _onboardAboutYouBloc;

  @override
  void initState() {
    final userCubit = context.read<UserBloc>();
    _editProfilePageBloc = getIt<EditProfilePageBloc>();
    _userUpdateCubit = UserUpdateCubit(
      updateUserUseCase: getIt<UpdateUserUseCase>(),
    );
    _onboardAboutYouBloc = getIt<OnboardAboutYouBloc>()
      ..add(
        const OnboardAboutYouEvent.load(),
      );

    _firstNameController.text =
        userCubit.state.userData?.firstName ?? _firstNameController.text;
    _lastNameController.text =
        userCubit.state.userData?.lastName ?? _lastNameController.text;
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
    _onboardAboutYouBloc.close();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _bioController.dispose();
    _skillController.dispose();
    _countryController.dispose();
    _cityController.dispose();
    super.dispose();
  }

  void _onCachedCredentialsReady(OnboardAboutYouState state) {
    // Seed the name fields from the Apple-authorization cache only when they
    // are still empty (Firestore-loaded values take priority).
    if (_firstNameController.text.isEmpty && state.firstName.isNotEmpty) {
      _firstNameController.text = state.firstName;
    }
    if (_lastNameController.text.isEmpty && state.lastName.isNotEmpty) {
      _lastNameController.text = state.lastName;
    }
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

  Future<void> onNext() async {
    if (!_formKey.currentState!.validate()) return;
    final skills = _editProfilePageBloc.state.skills;
    final userData = context.read<UserBloc>().state.userData;
    final onboardBloc = context.read<OnboardBloc>();

    // location.hasCoordinates is backend-owned: always copy the existing
    // value forward, never force it true, even right after a detection.
    final location = UserLocation.fromText(
      country: _countryController.text,
      city: _cityController.text,
      countryCode: _editProfilePageBloc.state.detectedPlace?.countryCode,
      hasCoordinates: userData?.location?.hasCoordinates ?? false,
    );

    await _userUpdateCubit.update(
      userData != null
          ? userData.copyWith(
              firstName: _firstNameController.text,
              lastName: _lastNameController.text,
              aboutMe: _bioController.text,
              location: location,
              profiler: userData.profiler.copyWith(
                skills: skills,
              ),
            )
          : UserData.none().copyWith(
              firstName: _firstNameController.text,
              lastName: _lastNameController.text,
              aboutMe: _bioController.text,
              location: location,
              profiler: UserProfiler.none(),
            ),
      image,
    );

    // Only sent when "Use my location" was tapped in this session — never a
    // retry loop, per docs/location_backend_contract.md §2. Non-fatal: the
    // profile itself is already saved above.
    final detectedPosition = _editProfilePageBloc.state.detectedPosition;
    if (detectedPosition != null) {
      await getIt<UpdateUserCoordinatesUseCase>().call(
        position: detectedPosition,
        place: _editProfilePageBloc.state.detectedPlace,
      );
    }

    onboardBloc.add(
      OnboardEvent.update(
        toldAboutYourself: true,
      ),
    );

    if (!mounted) return;
    OnboardSurveyPageRoute().go(
      context,
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
    final lo = AppLocalizations.of(context)!;
    final userData = context.read<UserBloc>().state.userData;
    return BlocProvider<OnboardAboutYouBloc>.value(
      value: _onboardAboutYouBloc,
      child: BlocProvider<EditProfilePageBloc>.value(
        value: _editProfilePageBloc,
        child: MultiBlocListener(
          listeners: [
            BlocListener<OnboardAboutYouBloc, OnboardAboutYouState>(
              listenWhen: (p, c) => p.status != c.status,
              listener: (context, state) {
                if (state.isReady) {
                  _onCachedCredentialsReady(state);
                }
              },
            ),
            BlocListener<UserBloc, UserState>(
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
            bloc: _editProfilePageBloc,
            builder: (context, state) {
              final availableSkills = context.watch<SkillsBloc>().state.skills;

              return BuildAnimatedBackground(
                child: SafeArea(
                  child: Scaffold(
                    backgroundColor: Colors.transparent,
                    appBar: CustomAppBar(
                      leading: Container(),
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            spacing: 20,
                            children: [
                              Center(
                                child: BuildUserAvatar(
                                  width: 100.0,
                                  height: 100.0,
                                  onTap: onTapAvatar,
                                  url: userData?.avatarUrl,
                                  cacheImg: image,
                                ),
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
                              BuildGroupedInput(
                                title: lo.location_group_title,
                                child: BuildLocationSection(
                                  countryController: _countryController,
                                  cityController: _cityController,
                                  isDetecting: state.isDetectingLocation,
                                  errorMessage: state.locationError,
                                  settingsTarget: state.locationSettingsTarget,
                                  onUseMyLocation: onUseMyLocation,
                                  onOpenSettings: onOpenLocationSettings,
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
                                  // CustomTextBtn(
                                  //   onPressed: onCancel,
                                  //   text: 'Cancel',
                                  // ),
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
      ),
    );
  }
}
